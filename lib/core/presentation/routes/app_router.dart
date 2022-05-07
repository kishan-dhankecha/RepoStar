import 'package:auto_route/annotations.dart';
import 'package:repostar/auth/presentation/authorization_page.dart';
import 'package:repostar/auth/presentation/sign_in_page.dart';
import 'package:repostar/github/readme/presentation/readme_page.dart';
import 'package:repostar/github/repos/searched_repo/presentation/searched_repos_page.dart';
import 'package:repostar/github/repos/starred_repo/presentation/starred_repo_page.dart';
import 'package:repostar/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/sign-in'),
    MaterialRoute(page: AuthorizationPage, path: '/auth'),
    MaterialRoute(page: StarredRepoPage, path: '/starred'),
    MaterialRoute(page: SearchedRepoPage, path: '/search'),
    MaterialRoute(page: ReadmePage, path: '/readme'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
