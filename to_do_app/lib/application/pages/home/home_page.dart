import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../dashboard/dashboard_page.dart';
import '../overview/overview_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required String tab
  }) : index = tabs.indexWhere((element) => element.name == tab);

  final int index;

  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs.map((page) => NavigationDestination(icon: Icon(page.icon), label: page.name)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp:SlotLayout.from(key: const Key('primary-navigation-medium'),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  onDestinationSelected: (index) => _tapOnNavigatioonDestination(context, index),
                  destinations: destinations
                      .map((element) => AdaptiveScaffold.toRailDestination(element),
                  ).toList())),

            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small:SlotLayout.from(key: const Key('bottom-navigation-small'),
                  builder: (context) => AdaptiveScaffold.standardBottomNavigationBar(
                      destinations: destinations,
                      onDestinationSelected: (index) => _tapOnNavigatioonDestination(context, index))),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp:SlotLayout.from(key: const Key('primary-body'),
                  builder: (context) =>  const Placeholder())
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp:SlotLayout.from(key: const Key('secondary-body'),
                  builder: (context) =>  const Placeholder())
            },
          ),
        ),
      ),
    );
  }

  void _tapOnNavigatioonDestination(BuildContext context, int index) => context.go('/home/${HomePage.tabs[index].name}');
}
