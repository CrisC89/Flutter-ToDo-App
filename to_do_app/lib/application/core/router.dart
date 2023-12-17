import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/application/core/go_router_observer.dart';
import 'package:to_do_app/application/pages/home/home_page.dart';
import 'package:to_do_app/application/pages/settings/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root'
);

final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'shell'
);

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
    initialLocation: '/home/dashboard',
    observers: [GoRouterObserver()],
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => child,
          routes: [
            GoRoute(path: '/home/:tab', builder: (context, state) => HomePage(
              key: state.pageKey,
              tab: state.pathParameters['tab'] ?? 'dashboard'
            )
            )
          ]),
      GoRoute(path: '/home/settings', builder: (context, state) {
        return SettingsPage();
      }),

    ]
);
