import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:repostar/auth/shared/providers.dart';
import 'package:repostar/github/core/shared/providers.dart';
import 'package:repostar/github/repos/starred_repo/presentation/paginated_repos_list_view.dart';

class StarredRepoPage extends ConsumerStatefulWidget {
  const StarredRepoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StarredRepoPage> createState() => _StarredRepoPageState();
}

class _StarredRepoPageState extends ConsumerState<StarredRepoPage> {
  @override
  void initState() {
    super.initState();
    ref.read(starredReposNotifierProvider.notifier).getNextStarredReposPage();
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
        ],
      ),
      body: const PaginatedReposListView(),
    );
  }
}
