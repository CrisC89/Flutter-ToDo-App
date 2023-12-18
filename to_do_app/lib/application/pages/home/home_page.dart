import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/application/core/page_config.dart';
import 'package:to_do_app/application/pages/settings/settings_page.dart';

import '../dashboard/dashboard_page.dart';
import '../overview/overview_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required String tab
  }) : index = tabs.indexWhere((element) => element.name == tab);

  final int index;

  static const PageConfig pageConfig = PageConfig(icon: Icons.home_rounded, name: 'home');

  //list of tabs that should be displayed inside navigation bar
  static const tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs.map((page) => NavigationDestination(
      icon: Icon(page.icon),
      label: page.name
    )
  ).toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp:SlotLayout.from(key: const Key('primary-navigation-medium'),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                 /*trailing: IconButton(
                    onPressed: () => context.pushNamed(SettingsPage.pageConfig.name),
                    icon: Icon(SettingsPage.pageConfig.icon)
                  ),*/
                  selectedLabelTextStyle: TextStyle(color: theme.colorScheme.onBackground),
                  selectedIconTheme: IconThemeData(color: theme.colorScheme.onBackground),
                  unselectedIconTheme: IconThemeData(color: theme.colorScheme.onBackground.withOpacity(0.5)),
                  selectedIndex: widget.index,
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
                    currentIndex: widget.index,
                      destinations: destinations,
                      onDestinationSelected: (index) => _tapOnNavigatioonDestination(context, index))),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp:SlotLayout.from(key: const Key('primary-body'),
                  builder: (context) =>  HomePage.tabs[widget.index].child)
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp:SlotLayout.from(key: const Key('secondary-body'),
                  builder: AdaptiveScaffold.emptyBuilder)
            },
          ),
        ),
      ),
    );
  }

  void _tapOnNavigatioonDestination(BuildContext context, int index) => context.goNamed(
      HomePage.pageConfig.name,
      pathParameters : {'tab': HomePage.tabs[index].name});
}
