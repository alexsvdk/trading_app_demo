import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/models/app_routes.dart';

/// Main screen with bottom navigation bar
class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    super.key,
    required this.navigationShell,
  });

  final List<NavigationItem> _navigationItems = const [
    NavigationItem(
      route: AppRoutes.marketWatch,
      iconPath: 'assets/images/navbar/favirites.svg',
      label: 'Home',
    ),
    NavigationItem(
      route: AppRoutes.portfolio,
      iconPath: 'assets/images/navbar/wallet.svg',
      label: 'Portfolio',
    ),
    NavigationItem(
      route: AppRoutes.orders,
      iconPath: 'assets/images/navbar/order.svg',
      label: 'Orders',
    ),
    NavigationItem(
      route: AppRoutes.positions,
      iconPath: 'assets/images/navbar/positions.svg',
      label: 'Positions',
    ),
  ];

  void _goBranch(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF436EDD),
        unselectedItemColor: Colors.grey,
        items: _navigationItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              item.iconPath,
              colorFilter: ColorFilter.mode(
                index == navigationShell.currentIndex
                    ? const Color(0xFF436EDD)
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final AppRoutes route;
  final String iconPath;
  final String label;

  const NavigationItem({
    required this.route,
    required this.iconPath,
    required this.label,
  });
}
