import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/components/bottom_nav_bar.dart';

/// Main screen with bottom navigation bar
class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  final List<NavItem> _navigationItems = const [
    NavItem(
      label: 'My Favorites',
      iconPath: 'assets/images/navbar/favirites.svg',
    ),
    NavItem(label: 'Order', iconPath: 'assets/images/navbar/order.svg'),
    NavItem(
      label: 'Watchlist',
      iconPath: 'assets/images/navbar/favirites.svg',
      isCenter: true,
    ),
    NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
    NavItem(label: 'Wallet', iconPath: 'assets/images/navbar/wallet.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: Stack(
            children: [
              navigationShell,
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavBar(
                  currentIndex: navigationShell.currentIndex,
                  onTap: navigationShell.goBranch,
                  isLandscape: orientation == Orientation.landscape,
                  items: _navigationItems,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
