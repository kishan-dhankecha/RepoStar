import 'package:dio/dio.dart';
import 'package:repostar/auth/application/auth_notifier.dart';
import 'package:repostar/auth/infrastructure/github_authenticator.dart';

class Oauth2Interceptor extends Interceptor {
  final GithubAuthenticator _authenticator;
  final AuthNotifier _authNotifier;
  final Dio _dio;

  Oauth2Interceptor(this._authenticator, this._authNotifier, this._dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credentials = await _authenticator.getSignedInCredentials();
    final modifiedOption = options
      ..headers.addAll(
        credentials == null
            ? {}
            : {'Authorization': 'bearer ${credentials.accessToken}'},
      );
    handler.next(modifiedOption);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errRes = err.response;
    if (errRes != null && errRes.statusCode == 401) {
      final credentials = await _authenticator.getSignedInCredentials();

      credentials != null && credentials.canRefresh
          ? await _authenticator.refresh(credentials)
          : await _authenticator.clearCredentialsStorage();

      await _authNotifier.checkAndUpdateAuthState();

      final refreshCredential = await _authenticator.getSignedInCredentials();

      if (refreshCredential != null) {
        final token = 'bearer ${refreshCredential.accessToken}';
        handler.resolve(
          await _dio.fetch(
            errRes.requestOptions..headers['Authorization'] = token,
          ),
        );
      }
    } else {
      handler.next(err);
    }
  }
}
