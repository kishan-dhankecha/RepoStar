import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show Dio, Options, DioError;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart';
import 'package:repostar/auth/domain/auth_failure.dart';
import 'package:repostar/auth/infrastructure/credential_storage/credential_storage.dart';
import 'package:repostar/core/infrastructure/dio_extension.dart';
import 'package:repostar/core/shared/encoder.dart';

class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  final CredentialStorage _credentialStorage;
  final Dio _dio;

  GithubAuthenticator(this._credentialStorage, this._dio);

  static const clientId = '55ac2e6ac31d37e51676';
  static const clientSecret = 'f47f43f023d3d3e91887046a379bd2855c22d129';
  static const scopes = ['read:user', 'repo'];
  static final authEndpoint = Uri.parse(
    'https://github.com/login/oauth/authorize',
  );
  static final tokenEndpoint = Uri.parse(
    'https://github.com/login/oauth/access_token',
  );
  static final redirectUrl = Uri.parse(
    'http://localhost:3000/callback',
  );
  static final revocationEndpoint = Uri.parse(
    'https://api.github.com/application/$clientId/token',
  );

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialStorage.read();
      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          final failureOrCredentials = await refresh(storedCredentials);
          return failureOrCredentials.fold((l) => null, (r) => r);
        }
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> isSignedIn() async => await getSignedInCredentials() != null;

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: GithubOAuthHttpClient(),
    );
  }

  Uri getAuthUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queryParams);
      await _credentialStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    final accessToken = (await _credentialStorage.read())?.accessToken;

    final user = stringToBase64.encode("$clientId:$clientSecret");
    try {
      try {
        await _dio.deleteUri(
          revocationEndpoint,
          data: {'access_token': accessToken},
          options: Options(
            headers: {'Authorization': 'basic $user'},
          ),
        );
      } on DioError catch (e) {
        if (e.isNoConnectionError) {
          log('Token not revoked');
        } else {
          rethrow;
        }
      }
      await _credentialStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
    Credentials credentials,
  ) async {
    try {
      final refreshedCredentials = await credentials.refresh(
        identifier: clientId,
        secret: clientSecret,
        httpClient: GithubOAuthHttpClient(),
      );
      await _credentialStorage.save(refreshedCredentials);
      return right(refreshedCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
