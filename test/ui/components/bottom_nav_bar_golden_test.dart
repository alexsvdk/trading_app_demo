import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:trading_app_demo/ui/components/bottom_nav_bar.dart';

void main() {
  testGoldens('Portrait layout - My Favorites active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'My Favorites', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Order', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
      NavItem(label: 'Wallet', iconPath: 'assets/images/navbar/wallet.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 0,
              onTap: (_) {},
              isLandscape: false,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(375, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_portrait_my_favorites.png'),
    );
  });

  testGoldens('Portrait layout - Order active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'My Favorites', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Order', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
      NavItem(label: 'Wallet', iconPath: 'assets/images/navbar/wallet.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 1,
              onTap: (_) {},
              isLandscape: false,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(375, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_portrait_order.png'),
    );
  });

  testGoldens('Portrait layout - Watchlist active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'Home', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Portfolio', iconPath: 'assets/images/navbar/wallet.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Orders', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 2,
              onTap: (_) {},
              isLandscape: false,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(375, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_portrait_watchlist.png'),
    );
  });

  testGoldens('Portrait layout - Positions active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'My Favorites', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Order', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
      NavItem(label: 'Wallet', iconPath: 'assets/images/navbar/wallet.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 3,
              onTap: (_) {},
              isLandscape: false,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(375, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_portrait_positions.png'),
    );
  });

  testGoldens('Portrait layout - Wallet active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'My Favorites', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Order', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
      NavItem(label: 'Wallet', iconPath: 'assets/images/navbar/wallet.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 4,
              onTap: (_) {},
              isLandscape: false,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(375, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_portrait_wallet.png'),
    );
  });

  testGoldens('Landscape layout - My Favorites active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'My Favorites', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Order', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
      NavItem(label: 'Wallet', iconPath: 'assets/images/navbar/wallet.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 0,
              onTap: (_) {},
              isLandscape: true,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(667, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_landscape_my_favorites.png'),
    );
  });

  testGoldens('Landscape layout - Watchlist active', (tester) async {
    await loadAppFonts();

    final testItems = const [
      NavItem(label: 'Home', iconPath: 'assets/images/navbar/favirites.svg'),
      NavItem(label: 'Portfolio', iconPath: 'assets/images/navbar/wallet.svg'),
      NavItem(label: 'Watchlist', iconPath: 'assets/images/navbar/favirites.svg', isCenter: true),
      NavItem(label: 'Orders', iconPath: 'assets/images/navbar/order.svg'),
      NavItem(label: 'Positions', iconPath: 'assets/images/navbar/positions.svg'),
    ];

    await tester.pumpWidgetBuilder(
      MaterialApp(
        home: Scaffold(
          body: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.white,
            child: CustomBottomNavBar(
              currentIndex: 2,
              onTap: (_) {},
              isLandscape: true,
              items: testItems,
            ),
          ),
        ),
      ),
      surfaceSize: Size(667, 375),
    );

    await expectLater(
      find.byType(CustomBottomNavBar),
      matchesGoldenFile('goldens/navbar_landscape_watchlist.png'),
    );
  });
}
