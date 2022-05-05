import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/core/presentation/toast.dart';
import 'package:repostar/github/core/presentation/no_results_display.dart';
import 'package:repostar/github/repos/core/application/paginated_repos_notifier.dart';
import 'package:repostar/github/repos/core/presentation/failure_repo_tile.dart';
import 'package:repostar/github/repos/core/presentation/loading_repo_tile.dart';
import 'package:repostar/github/repos/core/presentation/repo_tile.dart';

class PaginatedReposListView extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginatedReposNotifier, PaginatedReposState>
      paginatedReposNotifierProvider;
  final void Function() getNextPage;
  final String noResultMessage;
  const PaginatedReposListView({
    Key? key,
    required this.getNextPage,
    required this.noResultMessage,
    required this.paginatedReposNotifierProvider,
  }) : super(key: key);

  @override
  PaginatedReposListViewState createState() {
    return _PaginatedReposListViewState();
  }
}

typedef PaginatedReposListViewState = ConsumerState<PaginatedReposListView>;

class _PaginatedReposListViewState extends PaginatedReposListViewState {
  bool canLoadNextPage = false;
  bool hasAlreadyShownNoConnectionToast = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<PaginatedReposState>(
      widget.paginatedReposNotifierProvider,
      (previous, next) => next.map(
        initial: (_) => canLoadNextPage = true,
        loadInProgress: (_) => canLoadNextPage = false,
        loadFailure: (_) => canLoadNextPage = false,
        loadSuccess: (_) {
          if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
            showNoConnectionToast(
              "Couldn't reach servers.\n"
              "Some Data may be outdated.",
              context,
            );
          }
          canLoadNextPage = _.hasNextPage;
          return null;
        },
      ),
    );
    final state = ref.watch(widget.paginatedReposNotifierProvider);
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final matrix = notification.metrics;
        final limit = matrix.maxScrollExtent - (matrix.viewportDimension / 3);
        if (canLoadNextPage && matrix.pixels >= limit) {
          canLoadNextPage = false;
          widget.getNextPage();
        }
        return false;
      },
      child: state.maybeWhen<bool>(
        loadSuccess: (repos, _) => repos.entity.isEmpty,
        orElse: () => false,
      )
          ? NoResultsDisplay(widget.noResultMessage)
          : _PaginatedListView(state: state),
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadFailure: (_) => _.repos.entity.length + 1,
        loadSuccess: (_) => _.repos.entity.length,
      ),
      itemBuilder: (ctx, index) {
        return state.map(
          initial: (_) => const Text('initial'),
          loadInProgress: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            }
            return const LoadingRepoTile();
          },
          loadFailure: (_) {
            if (index < _.repos.entity.length) {
              return RepoTile(repo: _.repos.entity[index]);
            }
            return FailureRepoTile(_.failure);
          },
          loadSuccess: (_) => RepoTile(repo: _.repos.entity[index]),
        );
      },
    );
  }
}
