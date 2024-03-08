import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  ],
);
