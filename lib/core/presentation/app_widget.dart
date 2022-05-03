import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repostar/auth/application/auth_notifier.dart';
import 'package:repostar/auth/shared/providers.dart';
import 'package:repostar/core/presentation/routes/app_router.gr.dart';
import 'package:repostar/core/shared/providers.dart';

final initializationProvider = FutureProvider((ref) async {
  await ref.read(sembastProvider).init();
  ref.read(dioProvider)
    ..interceptors.add(ref.read(oauth2InterceptorProvider))
    ..options = BaseOptions(
      headers: {'Accept': "application/vnd.github.v3.html+json"},
    );
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthState();
});

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});
    ref.listen<AuthState>(
      authNotifierProvider,
      (previous, state) {
        state.maybeMap(
          orElse: () {},
          authenticated: (_) {
            appRouter.pushAndPopUntil(
              const StarredRepoRoute(),
              predicate: (route) => false,
            );
          },
          unauthenticated: (_) {
            appRouter.pushAndPopUntil(
              const SignInRoute(),
              predicate: (route) => false,
            );
          },
        );
      },
    );
    return MaterialApp.router(
      title: 'RepoStar',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
