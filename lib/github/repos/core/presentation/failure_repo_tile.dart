import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/github/core/domain/github_failure.dart';
import 'package:repostar/github/core/shared/providers.dart';

class FailureRepoTile extends ConsumerWidget {
  final GithubFailure _failure;
  const FailureRepoTile(
    this._failure, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: ref
                .read(starredReposNotifierProvider.notifier)
                .getNextStarredReposPage,
          ),
        ),
      ),
    );
  }
}
