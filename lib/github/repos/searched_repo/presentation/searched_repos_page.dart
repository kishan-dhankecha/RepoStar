import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/auth/shared/providers.dart';
import 'package:repostar/core/presentation/routes/app_router.gr.dart';
import 'package:repostar/core/presentation/toast.dart';
import 'package:repostar/github/core/shared/providers.dart';
import 'package:repostar/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:repostar/search/presentation/search_bar.dart';

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
          .getFirstSearchedReposPage(widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBar(
        title: widget.query,
        hint: 'Search all repositories...',
        onSearched: (query) {
          AutoRouter.of(context).pushAndPopUntil(
            SearchedRepoRoute(query: query),
            predicate: (route) => route.settings.name == StarredRepoRoute.name,
          );
        },
        onSignedOut: () async {
          final logOut = await showSignOutConfirmation(context);
          if (logOut) ref.read(authNotifierProvider.notifier).signOut();
        },
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: searchedReposNotifierProvider,
          noResultMessage: "No result are there for your search term.",
          getNextPage: () => ref
              .read(searchedReposNotifierProvider.notifier)
              .getNextSearchedReposPage(widget.query),
        ),
      ),
    );
  }
}
