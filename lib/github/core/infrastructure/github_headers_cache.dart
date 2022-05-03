import 'package:repostar/core/infrastructure/sembast_database.dart';
import 'package:repostar/github/core/infrastructure/github_headers.dart';
import 'package:sembast/sembast.dart';

class GithubHeadersCache {
  final SembastDatabase _sembastDatabase;
  final _store = stringMapStoreFactory.store('headers');

  GithubHeadersCache(this._sembastDatabase);

  Future<void> saveHeaders(Uri uri, GithubHeaders headers) async {
    _store.record('$uri').put(_sembastDatabase.instance, headers.toJson());
  }

  Future<GithubHeaders?> getHeaders(Uri uri) async {
    final json = await _store.record('$uri').get(_sembastDatabase.instance);
    return json == null ? null : GithubHeaders.fromJson(json);
  }

  Future<void> deleteHeaders(Uri uri) async {
    await _store.record('$uri').delete(_sembastDatabase.instance);
  }
}
