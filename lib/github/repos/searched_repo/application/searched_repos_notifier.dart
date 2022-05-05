import 'package:repostar/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repostar/github/repos/searched_repo/Infrastructure/searched_repos_repository.dart';

class SearchedReposNotifier extends PaginatedReposNotifier {
  final SearchedReposRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getNextStarredReposPage(String query) async => super.getNextPage(
        (page) => _repository.getSearchedReposPage(
          query,
          page,
        ),
      );
}
