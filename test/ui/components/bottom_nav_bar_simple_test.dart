import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trading_app_demo/ui/components/bottom_nav_bar.dart';

void main() {
  testWidgets('Simple navbar test', (tester) async {
    final testItems = const [
      NavItem(
        label: 'Home',
        iconPath: 'assets/images/navbar/favirites.svg',
      ),
      NavItem(
        label: 'Portfolio',
        iconPath: 'assets/images/navbar/wallet.svg',
      ),
      NavItem(
        label: 'Watchlist',
        iconPath: 'assets/images/navbar/favirites.svg',
        isCenter: true,
      ),
      NavItem(
        label: 'Orders',
        iconPath: 'assets/images/navbar/order.svg',
      ),
      NavItem(
        label: 'Positions',
        iconPath: 'assets/images/navbar/positions.svg',
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
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
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Portfolio'), findsOneWidget);
    expect(find.text('Watchlist'), findsOneWidget);
    expect(find.text('Orders'), findsOneWidget);
    expect(find.text('Positions'), findsOneWidget);
  });
}
