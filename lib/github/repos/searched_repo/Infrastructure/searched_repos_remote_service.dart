import 'package:dio/dio.dart';
import 'package:repostar/core/infrastructure/remote_response.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/core/infrastructure/github_repo_dto.dart';
import 'package:repostar/github/core/infrastructure/pagination_config.dart';
import 'package:repostar/github/repos/core/infrastructure/repos_remote_service.dart';

class SearchedReposRemoteService extends ReposRemoteService {
  SearchedReposRemoteService(
    Dio _dio,
    GithubHeadersCache _githubHeadersCache,
  ) : super(_dio, _githubHeadersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getSearchedReposPage(
    String query,
    int page,
  ) async =>
      super.getPage(
        requestUri: Uri.https(
          "api.github.com",
          "/search/repositories",
          {
            "q": query,
            "page": '$page',
            "per_page": '${PaginationConfig.itemsPerPage}',
          },
        ),
        jsonDataSelector: (json) => json["items"] as List<dynamic>,
      );
}
