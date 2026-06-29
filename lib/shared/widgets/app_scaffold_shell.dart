import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/app_routes.dart';

class AppScaffoldShell extends StatelessWidget {
  const AppScaffoldShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _resolveIndex(location);

    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.auto_awesome), label: 'Feature1'),
          NavigationDestination(icon: Icon(Icons.lock_open), label: 'Feature2'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        onDestinationSelected: (index) {
          final route = switch (index) {
            0 => AppRoutes.home,
            1 => AppRoutes.feature1,
            2 => AppRoutes.feature2,
            _ => AppRoutes.settings,
          };
          context.go(route);
        },
      ),
    );
  }

  int _resolveIndex(String location) {
    if (location.startsWith(AppRoutes.feature1)) {
      return 1;
    }

    if (location.startsWith(AppRoutes.feature2)) {
      return 2;
    }

    if (location.startsWith(AppRoutes.settings)) {
      return 3;
    }

    return 0;
  }
}