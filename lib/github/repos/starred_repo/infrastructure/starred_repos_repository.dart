import 'package:dartz/dartz.dart';
import 'package:repostar/core/domain/fresh.dart';
import 'package:repostar/core/infrastructure/network_exceptions.dart';
import 'package:repostar/github/core/domain/github_failure.dart';
import 'package:repostar/github/core/domain/github_repo.dart';
import 'package:repostar/github/core/infrastructure/github_repo_dto.dart';
import 'package:repostar/github/repos/starred_repo/infrastructure/starred_repos_local_service.dart';
import 'package:repostar/github/repos/starred_repo/infrastructure/starred_repos_remote_service.dart';

class StarredReposRepository {
  final StarredReposRemoteService _remoteService;
  final StarredReposLocalService _localService;

  StarredReposRepository(this._remoteService, this._localService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteService.getStarredReposPage(page);
      return right(
        await remotePageItems.when(
          noConnection: () async {
            return Fresh.no(
              await _localService.getPage(page).then((_) => _.toDomain()),
              hasNextPage: page < (await _localService.getLocalPageCount()),
            );
          },
          notModified: (maxPage) async {
            return Fresh.yes(
              await _localService.getPage(page).then((_) => _.toDomain()),
              hasNextPage: page < maxPage,
            );
          },
          withNewData: (data, maxPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              hasNextPage: page < maxPage,
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}

extension on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
