import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:repostar/core/domain/fresh.dart';
import 'package:repostar/core/infrastructure/network_exceptions.dart';
import 'package:repostar/github/core/domain/github_failure.dart';
import 'package:repostar/github/readme/domain/readme.dart';
import 'package:repostar/github/readme/infrastructure/readme_dto.dart';
import 'package:repostar/github/readme/infrastructure/readme_local_service.dart';
import 'package:repostar/github/readme/infrastructure/readme_remote_service.dart';

class ReadmeRepository {
  final ReadmeLocalService _localService;
  final ReadmeRemoteService _remoteService;

  ReadmeRepository(this._localService, this._remoteService);

  /// Return `right(null)` if there's no internet connection
  Future<Either<GithubFailure, Fresh<Readme?>>> getReadme(
    String fullName,
  ) async {
    try {
      try {
        final html = await _remoteService.getReadmeHtml(fullName);
        return right(await html.when(
          noConnection: () async {
            return Fresh.no(
              await _localService.getReadme(fullName).then((dto) {
                return dto?.toDomain();
              }),
            );
          },
          notModified: (_) async {
            final cachedDto = await _localService.getReadme(fullName);
            final starred = await _remoteService.getStarredStatus(fullName);
            final updatedDto = cachedDto?.copyWith(starred: starred ?? false);
            return Fresh.yes(updatedDto?.toDomain());
          },
          withNewData: (html, _) async {
            final starred = await _remoteService.getStarredStatus(fullName);
            final dto = ReadmeDto(
              html: html,
              starred: starred ?? false,
              fullName: fullName,
            );
            await _localService.upsertReadme(dto);
            return Fresh.yes(dto.toDomain());
          },
        ));
      } on DioError catch (e) {
        if (e.response?.statusCode == 404) {
          return right(Fresh.no(null));
        } else {
          rethrow;
        }
      }
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }

  /// Return `right(null)` if there's no internet connection
  Future<Either<GithubFailure, Unit?>> switchStarredStatus(
    Readme readme,
  ) async {
    try {
      final actionCompleted = await _remoteService.switchStarredStatus(
        readme.fullName,
        currentStatus: readme.starred,
      );
      return right(actionCompleted);
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
