import 'package:auto_route/annotations.dart';
import 'package:repostar/auth/presentation/authorization_page.dart';
import 'package:repostar/auth/presentation/sign_in_page.dart';
import 'package:repostar/splash/presentation/splash_page.dart';
import 'package:repostar/starred_repo/presentation/starred_repo_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/sign-in'),
    MaterialRoute(page: AuthorizationPage, path: '/auth'),
    MaterialRoute(page: StarredRepoPage, path: '/starred'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
