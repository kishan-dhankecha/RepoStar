import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/auth/application/auth_notifier.dart';
import 'package:repostar/auth/infrastructure/credential_storage/credential_storage.dart';
import 'package:repostar/auth/infrastructure/credential_storage/secure_credential_storage.dart';
import 'package:repostar/auth/infrastructure/github_authenticator.dart';

final dioProvider = Provider((ref) => Dio());

final flutterSecureStorageProvider = Provider((ref) {
  return const FlutterSecureStorage();
});

final credentialStorageProvider = Provider<CredentialStorage>((ref) {
  return SecureCredentialStorage(ref.watch(flutterSecureStorageProvider));
});

final githubAuthenticatorProvider = Provider((ref) {
  return GithubAuthenticator(
    ref.watch(credentialStorageProvider),
    ref.watch(dioProvider),
  );
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(githubAuthenticatorProvider),
  ),
);
