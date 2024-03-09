import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profy/app/modules/auth/presenter/auth_page.dart';
import 'package:profy/app/modules/splash/presenter/splash_page.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: '/auth',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
        key: state.pageKey,
        child: const AuthPage(),
      ),
    ),
  ],
);
