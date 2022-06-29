import 'package:flutter/material.dart';
import 'package:repostar/github/core/domain/github_failure.dart';
import 'package:repostar/github/repos/core/presentation/paginated_repos_list_view.dart';

class FailureRepoTile extends StatelessWidget {
  final GithubFailure _failure;
  const FailureRepoTile(this._failure, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Theme.of(context).colorScheme.onError,
      iconColor: Theme.of(context).colorScheme.onError,
      child: Card(
        color: Theme.of(context).errorColor,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.warning),
          ),
          title: const Text('An error ocurred, please retry'),
          subtitle: Text(
            'Api returned ${_failure.errorCode}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: context
                .findAncestorWidgetOfExactType<PaginatedReposListView>()
                ?.getNextPage,
          ),
        ),
      ),
    );
  }
}
