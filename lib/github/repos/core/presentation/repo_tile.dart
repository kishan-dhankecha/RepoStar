import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:repostar/core/presentation/routes/app_router.gr.dart';
import 'package:repostar/github/core/domain/github_repo.dart';

class RepoTile extends StatelessWidget {
  final GithubRepo repo;
  const RepoTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.name),
      subtitle: Text(
        repo.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Hero(
        tag: repo.hashCode,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(repo.owner.avatar64),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_border),
          Text(
            '${repo.starGazersCount}',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      onTap: () => AutoRouter.of(context).push(ReadmeRoute(repo: repo)),
    );
  }
}
