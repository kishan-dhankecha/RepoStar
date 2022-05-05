// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../auth/presentation/authorization_page.dart' as _i3;
import '../../../auth/presentation/sign_in_page.dart' as _i2;
import '../../../github/repos/searched_repo/presentation/searched_repos_page.dart'
    as _i5;
import '../../../github/repos/starred_repo/presentation/starred_repo_page.dart'
    as _i4;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.AuthorizationPage(
              key: args.key,
              authorizationUrl: args.authorizationUrl,
              onAuthorizationCodeRedirectAttempt:
                  args.onAuthorizationCodeRedirectAttempt));
    },
    StarredRepoRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.StarredRepoPage());
    },
    SearchedRepoRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedRepoRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.SearchedRepoPage(args.query, key: args.key));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(SignInRoute.name, path: '/sign-in'),
        _i6.RouteConfig(AuthorizationRoute.name, path: '/auth'),
        _i6.RouteConfig(StarredRepoRoute.name, path: '/starred'),
        _i6.RouteConfig(SearchedRepoRoute.name, path: '/search')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.AuthorizationPage]
class AuthorizationRoute extends _i6.PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute(
      {_i7.Key? key,
      required Uri authorizationUrl,
      required void Function(Uri) onAuthorizationCodeRedirectAttempt})
      : super(AuthorizationRoute.name,
            path: '/auth',
            args: AuthorizationRouteArgs(
                key: key,
                authorizationUrl: authorizationUrl,
                onAuthorizationCodeRedirectAttempt:
                    onAuthorizationCodeRedirectAttempt));

  static const String name = 'AuthorizationRoute';
}

class AuthorizationRouteArgs {
  const AuthorizationRouteArgs(
      {this.key,
      required this.authorizationUrl,
      required this.onAuthorizationCodeRedirectAttempt});

  final _i7.Key? key;

  final Uri authorizationUrl;

  final void Function(Uri) onAuthorizationCodeRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationCodeRedirectAttempt: $onAuthorizationCodeRedirectAttempt}';
  }
}

/// generated route for
/// [_i4.StarredRepoPage]
class StarredRepoRoute extends _i6.PageRouteInfo<void> {
  const StarredRepoRoute() : super(StarredRepoRoute.name, path: '/starred');

  static const String name = 'StarredRepoRoute';
}

/// generated route for
/// [_i5.SearchedRepoPage]
class SearchedRepoRoute extends _i6.PageRouteInfo<SearchedRepoRouteArgs> {
  SearchedRepoRoute({required String query, _i7.Key? key})
      : super(SearchedRepoRoute.name,
            path: '/search',
            args: SearchedRepoRouteArgs(query: query, key: key));

  static const String name = 'SearchedRepoRoute';
}

class SearchedRepoRouteArgs {
  const SearchedRepoRouteArgs({required this.query, this.key});

  final String query;

  final _i7.Key? key;

  @override
  String toString() {
    return 'SearchedRepoRouteArgs{query: $query, key: $key}';
  }
}
