import 'package:dio/dio.dart';
import 'package:repostar/core/infrastructure/dio_extension.dart';
import 'package:repostar/core/infrastructure/network_exceptions.dart';
import 'package:repostar/core/infrastructure/remote_response.dart';
import 'package:repostar/github/core/infrastructure/github_headers.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/core/infrastructure/github_repo_dto.dart';

abstract class ReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _githubHeadersCache;

  ReposRemoteService(this._dio, this._githubHeadersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getPage({
    required Uri requestUri,
    required List<dynamic> Function(dynamic json) jsonDataSelector,
  }) async {
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
        final _convertedData = jsonDataSelector(response.data).map((e) {
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
