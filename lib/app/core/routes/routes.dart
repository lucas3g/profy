import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profy/app/core/domain/entities/named_routes.dart';
import 'package:profy/app/modules/auth/presenter/auth_page.dart';
import 'package:profy/app/modules/splash/presenter/splash_page.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: NamedRoutes.splash.route,
  routes: <GoRoute>[
    GoRoute(
      path: NamedRoutes.splash.route,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: NamedRoutes.login.route,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(
        key: state.pageKey,
        child: const AuthPage(),
      ),
    ),
  ],
);
