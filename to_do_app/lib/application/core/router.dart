import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/application/core/go_router_observer.dart';
import 'package:to_do_app/application/pages/home/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root'
);

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    observers: [GoRouterObserver()],
    routes: [
      GoRoute(path: '/home', builder: (context, state) {
        return HomePage();
      }),
      GoRoute(path: '/home/settings', builder: (context, state) {
        return Container(
            color: Colors.amber,
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text('Go to start'),
                  onPressed: () => context.push('/home/start'),
                ),
                TextButton(onPressed: () => {
                  if(context.canPop()){
                    context.pop()
                  }else{
                    context.push('/home/start')
                  }
                }, child: const Text('Go Back'))
              ],
            ));
      }),
      GoRoute(path: '/home/task', builder: (context, state) {
        return Container(
            color: Colors.grey,
            child: Column(
              children: [
                ElevatedButton(
                  child: const Text('Go to start'),
                  onPressed: () => context.push('/home/start'),
                ),
                ElevatedButton(
                  child: const Text('Go to settings'),
                  onPressed: () => context.push('/home/settings'),
                )
              ],
            ));
      })

    ]
);
