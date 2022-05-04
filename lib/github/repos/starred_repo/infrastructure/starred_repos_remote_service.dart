import 'package:dio/dio.dart';
import 'package:repostar/core/infrastructure/dio_extension.dart';
import 'package:repostar/core/infrastructure/network_exceptions.dart';
import 'package:repostar/core/infrastructure/remote_response.dart';
import 'package:repostar/github/core/infrastructure/github_headers.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/core/infrastructure/github_repo_dto.dart';
import 'package:repostar/github/core/infrastructure/pagination_config.dart';

class StarredReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _githubHeadersCache;

  StarredReposRemoteService(this._dio, this._githubHeadersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {
    final requestUri = Uri.https(
      "api.github.com",
      "/user/starred",
      {
        "page": '$page',
        "per_page": '${PaginationConfig.itemsPerPage}',
      },
    );
    final _previousHeaders = await _githubHeadersCache.getHeaders(requestUri);
    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {'If-None-Match': _previousHeaders?.eTag ?? ''},
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          maxPage: _previousHeaders?.link?.maxPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final _headers = GithubHeaders.parse(response);
        await _githubHeadersCache.saveHeaders(requestUri, _headers);
        final _convertedData = (response.data as List<dynamic>).map((e) {
          return GithubRepoDTO.fromJson(e as Map<String, dynamic>);
        }).toList();
        return RemoteResponse.withNewData(
          _convertedData,
          maxPage: _headers.link?.maxPage ?? 1,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
