import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/models/app_routes.dart';
import '../../../ui/theme/app_ui_constants.dart';

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
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;
        
        if (isLandscape) {
          // Landscape: Bottom nav only over scrollable content
          return Scaffold(
            body: Column(
              children: [
                // Content area (scrollable)
                Expanded(
                  child: navigationShell,
                ),
                // Bottom navigation bar (only over content)
                _buildBottomNavigationBar(context),
              ],
            ),
          );
        } else {
          // Portrait: Standard layout with bottom nav
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: _buildBottomNavigationBar(context),
          );
        }
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: _goBranch,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppUiConstants.activeTabColor,
      unselectedItemColor: AppUiConstants.inactiveColor,
      items: _navigationItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return BottomNavigationBarItem(
          icon: SvgPicture.asset(
            item.iconPath,
            colorFilter: ColorFilter.mode(
              index == navigationShell.currentIndex
                  ? AppUiConstants.activeTabColor
                  : AppUiConstants.inactiveColor,
              BlendMode.srcIn,
            ),
          ),
          label: item.label,
        );
      }).toList(),
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
