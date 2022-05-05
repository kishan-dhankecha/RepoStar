import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repostar/auth/shared/providers.dart';
import 'package:repostar/core/presentation/routes/app_router.gr.dart';
import 'package:repostar/github/core/shared/providers.dart';
import 'package:repostar/github/repos/core/presentation/paginated_repos_list_view.dart';

class StarredRepoPage extends ConsumerStatefulWidget {
  const StarredRepoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StarredRepoPage> createState() => _StarredRepoPageState();
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
        title: const Text('Starred Repo'),
        actions: [
          IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            onPressed: ref.read(authNotifierProvider.notifier).signOut,
          ),
          IconButton(
            icon: const Icon(MdiIcons.magnify),
            onPressed: () {
              AutoRouter.of(context).push(SearchedRepoRoute(query: 'react'));
            },
          ),
        ],
      ),
      body: PaginatedReposListView(
        paginatedReposNotifierProvider: starredReposNotifierProvider,
        noResultMessage: "We couldn't find any starred repos in your account.",
        getNextPage: () => ref
            .read(starredReposNotifierProvider.notifier)
            .getNextStarredReposPage(),
      ),
    );
  }
}
