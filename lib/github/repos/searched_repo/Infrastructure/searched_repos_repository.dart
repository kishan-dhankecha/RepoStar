import 'package:dartz/dartz.dart';
import 'package:repostar/core/domain/fresh.dart';
import 'package:repostar/core/infrastructure/network_exceptions.dart';
import 'package:repostar/github/core/domain/github_failure.dart';
import 'package:repostar/github/core/domain/github_repo.dart';
import 'package:repostar/github/repos/core/infrastructure/extensions.dart';
import 'package:repostar/github/repos/searched_repo/Infrastructure/searched_repos_remote_service.dart';

class SearchedReposRepository {
  final SearchedReposRemoteService _remoteService;

  SearchedReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getSearchedReposPage(
    String query,
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteService.getSearchedReposPage(
        query,
        page,
      );
      return right(await remotePageItems.maybeWhen(
        withNewData: (data, maxPage) => Fresh.yes(
          data.toDomain(),
          hasNextPage: page < maxPage,
        ),
        orElse: () => Fresh.no([], hasNextPage: false),
      ));
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
