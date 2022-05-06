import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:repostar/search/shared/provider.dart';

class SearchBar extends ConsumerStatefulWidget {
  final String title, hint;
  final Widget body;
  final void Function(String searchTerm) onSearched;
  final Function() onSignedOut;

  const SearchBar({
    Key? key,
    required this.title,
    required this.hint,
    required this.body,
    required this.onSearched,
    required this.onSignedOut,
  }) : super(key: key);

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late FloatingSearchBarController _searchBarController;
  final searchNotifier = searchHistoryNotifierProvider.notifier;
  @override
  void initState() {
    super.initState();
    _searchBarController = FloatingSearchBarController();
    ref.read(searchNotifier).watchSearchTerms();
  }

  @override
  Widget build(BuildContext context) {
    void pushPageAndPutFirstInHistory(String query) {
      _searchBarController.close();
      widget.onSearched(query);
      ref.read(searchNotifier).putSearchTermFirst(query);
    }

    void pushPageAndAddToHistory(String query) {
      _searchBarController.close();
      widget.onSearched(query);
      ref.read(searchNotifier).addSearchTerm(query);
    }

    return FloatingSearchBar(
      hint: widget.hint,
      controller: _searchBarController,
      body: FloatingSearchBarScrollNotifier(child: widget.body),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.headline6),
          Text("Tap to search 👆", style: Theme.of(context).textTheme.caption),
        ],
      ),
      automaticallyImplyBackButton: false,
      leadingActions: [
        if (AutoRouter.of(context).canPopSelfOrChildren)
          IconButton(
            icon: Icon(Icons.adaptive.arrow_back),
            splashRadius: 18,
            onPressed: AutoRouter.of(context).pop,
          ),
      ],
      actions: [
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
        FloatingSearchBarAction(
          child: IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            splashRadius: 18,
            onPressed: widget.onSignedOut,
          ),
        ),
      ],
      onSubmitted: pushPageAndAddToHistory,
      onQueryChanged: (query) {
        ref.read(searchNotifier).watchSearchTerms(filter: query);
      },
      builder: (context, transition) {
        final searchHistoryState = ref.watch(searchHistoryNotifierProvider);
        return Material(
          elevation: 4,
          clipBehavior: Clip.hardEdge,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          child: searchHistoryState.map(
            data: (history) {
              if (history.value.isEmpty && _searchBarController.query.isEmpty) {
                return Container(
                  height: 56,
                  alignment: Alignment.center,
                  child: Text(
                    'Start searching',
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              } else if (history.value.isEmpty) {
                return ListTile(
                  title: Text(_searchBarController.query),
                  leading: const Icon(Icons.search),
                  onTap: () {
                    pushPageAndAddToHistory(_searchBarController.query);
                  },
                );
              }
              return Column(
                children: history.value.map((term) {
                  return ListTile(
                    title: Text(
                      term,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: const Icon(Icons.history),
                    trailing: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        ref.read(searchNotifier).deleteSearchTerm(term);
                      },
                    ),
                    onTap: () => pushPageAndPutFirstInHistory(term),
                  );
                }).toList(),
              );
            },
            loading: (_) => const ListTile(
              title: LinearProgressIndicator(),
            ),
            error: (_) => ListTile(
              title: Text('Very unexpected error ${_.error}'),
            ),
          ),
        );
      },
    );
  }
}
