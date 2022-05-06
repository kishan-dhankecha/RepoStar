import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:repostar/core/infrastructure/dio_extension.dart';
import 'package:repostar/core/infrastructure/network_exceptions.dart';
import 'package:repostar/core/infrastructure/remote_response.dart';
import 'package:repostar/github/core/infrastructure/github_headers.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';

class ReadmeRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  ReadmeRemoteService(this._dio, this._headersCache);

  Future<RemoteResponse<String>> getReadmeHtml(String fullRepoName) async {
    final requestUri = Uri.https(
      "api.github.com",
      "/repos/$fullRepoName/readme",
    );

    final _previousHeaders = await _headersCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          responseType: ResponseType.plain,
          headers: {'If-None-Match': _previousHeaders?.eTag ?? ''},
        ),
      );

      if (response.statusCode == 304) {
        return const RemoteResponse.notModified(maxPage: 0);
      } else if (response.statusCode == 200) {
        final _headers = GithubHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, _headers);
        final html = response.data as String;
        return RemoteResponse.withNewData(html, maxPage: 0);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else {
        rethrow;
      }
    }
  }

  /// Returns `null` if there's no Internet connection.
  Future<bool?> getStarredStatus(String fullRepoName) async {
    try {
      final response = await _dio.getUri(
        Uri.https(
          "api.github.com",
          "/user/starred/$fullRepoName",
        ),
        options: Options(
          validateStatus: (status) {
            return (status != null && status >= 200 && status < 400) ||
                status == 404;
          },
        ),
      );

      switch (response.statusCode) {
        case 204:
          return true;
        case 404:
          return false;
        default:
          throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }

  /// Returns `null` if there's no Internet connection.
  Future<Unit?> switchStarredStatus(
    String fullRepoName, {
    required bool currentStatus,
  }) async {
    try {
      final response = await (currentStatus ? _dio.deleteUri : _dio.getUri)(
        Uri.https(
          "api.github.com",
          "/user/starred/$fullRepoName",
        ),
        options: Options(
          validateStatus: (status) =>
              (status != null && status >= 200 && status < 400) ||
              status == 404,
        ),
      );

      if (response.statusCode == 204) {
        return unit;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
