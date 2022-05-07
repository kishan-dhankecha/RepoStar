import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repostar/auth/shared/providers.dart';
import 'package:repostar/core/presentation/routes/app_router.gr.dart';
import 'package:repostar/core/presentation/toast.dart';
import 'package:repostar/github/core/shared/providers.dart';
import 'package:repostar/github/repos/core/presentation/paginated_repos_list_view.dart';
import 'package:repostar/search/presentation/search_bar.dart';

class StarredRepoPage extends ConsumerStatefulWidget {
  const StarredRepoPage({Key? key}) : super(key: key);

  @override
  _StarredRepoPageState createState() => _StarredRepoPageState();
}

class _StarredRepoPageState extends ConsumerState<StarredRepoPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred Repositories'),
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            splashRadius: 18,
            onPressed: () async {
              final logOut = await showSignOutConfirmation(context);
              if (logOut) ref.read(authNotifierProvider.notifier).signOut();
            },
          )
        ],
      ),
      body: SearchBar(
        title: 'Explore Github',
        hint: 'Search repositories...',
        onSearched: (query) {
          AutoRouter.of(context).push(SearchedRepoRoute(query: query));
        },
        body: PaginatedReposListView(
          paginatedReposNotifierProvider: starredReposNotifierProvider,
          noResultMessage: "We couldn't find any starred repositories.",
          getNextPage: () => ref
              .read(starredReposNotifierProvider.notifier)
              .getNextStarredReposPage(),
        ),
      ),
    );
  }
}
