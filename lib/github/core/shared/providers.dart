import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repostar/core/shared/providers.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/readme/application/readme_notifier.dart';
import 'package:repostar/github/readme/infrastructure/readme_local_service.dart';
import 'package:repostar/github/readme/infrastructure/readme_remote_service.dart';
import 'package:repostar/github/readme/infrastructure/readme_repository.dart';
import 'package:repostar/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repostar/github/repos/searched_repo/Infrastructure/searched_repos_remote_service.dart';
import 'package:repostar/github/repos/searched_repo/Infrastructure/searched_repos_repository.dart';
import 'package:repostar/github/repos/searched_repo/application/searched_repos_notifier.dart';
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

final starredReposNotifierProvider = StateNotifierProvider.autoDispose<
    StarredReposNotifier, PaginatedReposState>(
  (ref) {
    return StarredReposNotifier(ref.watch(starredReposRepositoryProvider));
  },
);

final searchedReposRemoteServiceProvider = Provider((ref) {
  return SearchedReposRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  );
});

final searchedReposRepositoryProvider = Provider((ref) {
  return SearchedReposRepository(
    ref.watch(searchedReposRemoteServiceProvider),
  );
});

final searchedReposNotifierProvider = StateNotifierProvider.autoDispose<
    SearchedReposNotifier, PaginatedReposState>(
  (ref) {
    return SearchedReposNotifier(ref.watch(searchedReposRepositoryProvider));
  },
);

final readmeLocalServiceProvider = Provider((ref) {
  return ReadmeLocalService(
    ref.watch(sembastProvider),
    ref.watch(githubHeadersCacheProvider),
  );
});

final readmeRemoteServiceProvider = Provider((ref) {
  return ReadmeRemoteService(
    ref.watch(dioProvider),
    ref.watch(githubHeadersCacheProvider),
  );
});

final readmeRepositoryProvider = Provider((ref) {
  return ReadmeRepository(
    ref.watch(readmeLocalServiceProvider),
    ref.watch(readmeRemoteServiceProvider),
  );
});

final readmeNotifierProvider =
    StateNotifierProvider.autoDispose<ReadmeNotifier, ReadmeState>((ref) {
  return ReadmeNotifier(ref.watch(readmeRepositoryProvider));
});
