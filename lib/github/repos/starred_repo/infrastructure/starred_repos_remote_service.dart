import 'package:dio/dio.dart';
import 'package:repostar/core/infrastructure/remote_response.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/core/infrastructure/github_repo_dto.dart';
import 'package:repostar/github/core/infrastructure/pagination_config.dart';
import 'package:repostar/github/repos/core/infrastructure/repos_remote_service.dart';

class StarredReposRemoteService extends ReposRemoteService {
  StarredReposRemoteService(
    Dio _dio,
    GithubHeadersCache _githubHeadersCache,
  ) : super(_dio, _githubHeadersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async =>
      super.getPage(
        requestUri: Uri.https(
          "api.github.com",
          "/user/starred",
          {
            "page": '$page',
            "per_page": '${PaginationConfig.itemsPerPage}',
          },
        ),
        jsonDataSelector: (json) => json as List<dynamic>,
      );
}
