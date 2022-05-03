import 'package:collection/collection.dart';
import 'package:repostar/core/infrastructure/sembast_database.dart';
import 'package:repostar/github/core/infrastructure/github_repo_dto.dart';
import 'package:repostar/github/core/infrastructure/pagination_config.dart';
import 'package:sembast/sembast.dart';

class StarredReposLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('starredRepos');

  StarredReposLocalService(this._sembastDatabase);

  Future<void> upsertPage(List<GithubRepoDTO> dtos, int page) async {
    final sembastPage = page - 1;
    _store.records(
      dtos.mapIndexed((i, _) {
        return i + PaginationConfig.itemsPerPage * sembastPage;
      }),
    ).put(
      _sembastDatabase.instance,
      dtos.map((e) {
        return e.toJson();
      }).toList(),
    );
  }

  Future<List<GithubRepoDTO>> getPage(int page) async {
    final sembastPage = page - 1;

    final records = await _store.find(
      _sembastDatabase.instance,
      finder: Finder(
        limit: PaginationConfig.itemsPerPage,
        offset: sembastPage * PaginationConfig.itemsPerPage,
      ),
    );

    return records.map((e) => GithubRepoDTO.fromJson(e.value)).toList();
  }
}
