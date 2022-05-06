import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/core/shared/providers.dart';
import 'package:repostar/search/application/search_history_notifier.dart';
import 'package:repostar/search/infrastructure/search_history_repository.dart';

final searchedHistoryRepositoryProvider = Provider((ref) {
  return SearchHistoryRepository(ref.watch(sembastProvider));
});

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(
    ref.watch(searchedHistoryRepositoryProvider),
  ),
);
