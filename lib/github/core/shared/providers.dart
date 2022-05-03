import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/core/shared/providers.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/repos/starred_repo/application/starred_repos_notifier.dart';
import 'package:repostar/github/repos/starred_repo/infrastructure/starred_repos_local_service.dart';
import 'package:repostar/github/repos/starred_repo/infrastructure/starred_repos_remote_service.dart';
import 'package:repostar/github/repos/starred_repo/infrastructure/starred_repos_repository.dart';

final githubHeadersCacheProvider = Provider((ref) {
  return GithubHeadersCache(ref.watch(sembastProvider));
});

final starredReposLocalServiceProvider = Provider((ref) {
  return StarredReposLocalService(ref.watch(sembastProvider));
});

final starredReposRemoteServiceProvider = Provider((ref) {
  return StarredReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  );
});

final starredReposRepositoryProvider = Provider((ref) {
  return StarredReposRepository(
    ref.watch(starredReposRemoteServiceProvider),
    ref.watch(starredReposLocalServiceProvider),
  );
});

final starredReposNotifierProvider =
    StateNotifierProvider<StarredReposNotifier, StarredReposState>(
  (ref) {
    return StarredReposNotifier(ref.watch(starredReposRepositoryProvider));
  },
);
