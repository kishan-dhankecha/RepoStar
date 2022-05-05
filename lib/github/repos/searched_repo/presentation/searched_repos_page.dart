import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repostar/auth/shared/providers.dart';
import 'package:repostar/github/core/shared/providers.dart';
import 'package:repostar/github/repos/core/presentation/paginated_repos_list_view.dart';

class SearchedRepoPage extends ConsumerStatefulWidget {
  final String query;
  const SearchedRepoPage(this.query, {Key? key}) : super(key: key);

  @override
  ConsumerState<SearchedRepoPage> createState() => _SearchedRepoPageState();
}

class _SearchedRepoPageState extends ConsumerState<SearchedRepoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ref
          .read(searchedReposNotifierProvider.notifier)
          .getNextSearchedReposPage(widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.query),
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: ref.read(authNotifierProvider.notifier).signOut,
          ),
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: searchedReposNotifierProvider,
        noResultMessage: "No result are there for your search term.",
        getNextPage: () => ref
            .read(searchedReposNotifierProvider.notifier)
            .getNextSearchedReposPage(widget.query),
      ),
    );
  }
}
