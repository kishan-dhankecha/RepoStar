import 'package:repostar/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repostar/github/repos/searched_repo/Infrastructure/searched_repos_repository.dart';

class SearchedReposNotifier extends PaginatedReposNotifier {
  final SearchedReposRepository _repository;

  SearchedReposNotifier(this._repository);

  Future<void> getFirstSearchedReposPage(String query) async {
    super.resetState();
    await getNextSearchedReposPage(query);
  }

  Future<void> getNextSearchedReposPage(String query) async {
    super.getNextPage(
      (page) => _repository.getSearchedReposPage(query, page),
    );
  }
}
