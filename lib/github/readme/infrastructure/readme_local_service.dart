import 'package:repostar/core/infrastructure/sembast_database.dart';
import 'package:repostar/github/core/infrastructure/github_headers_cache.dart';
import 'package:repostar/github/readme/infrastructure/readme_dto.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

class ReadmeLocalService {
  static const cacheSize = 50;

  final Database _db;
  final GithubHeadersCache _headersCache;
  final _store = stringMapStoreFactory.store('repoDetail');

  ReadmeLocalService(
    SembastDatabase db,
    this._headersCache,
  ) : _db = db.instance;

  Future<void> upsertReadme(ReadmeDto readmeDto) async {
    _store.record(readmeDto.fullName).put(_db, readmeDto.toSembast());
    final keys = await _store.findKeys(
      _db,
      finder: Finder(sortOrders: [
        SortOrder(ReadmeDto.lastUsedFieldName, false),
      ]),
    );

    if (keys.length > cacheSize) {
      keys.sublist(cacheSize).forEach((key) async {
        await _store.record(key).delete(_db);
        await _headersCache.deleteHeaders(Uri.https(
          "api.github.com",
          "/repos/$key/readme",
        ));
      });
    }
  }

  Future<ReadmeDto?> getReadme(String fullName) async {
    final record = _store.record(fullName);
    record.update(_db, {ReadmeDto.lastUsedFieldName: Timestamp.now()});
    final snapshot = await record.getSnapshot(_db);

    if (snapshot == null) return null;
    return ReadmeDto.fromSembast(snapshot);
  }
}
