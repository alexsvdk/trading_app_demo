import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/features/market_watch/presentation/models/market_watch_tabs.dart';
import 'package:trading_app_demo/ui/components/components.barrel.dart';

void main() {
  Future<void> pumpWithHeight(
    WidgetTester tester, {
    required double height,
    required Widget child,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              height: height,
              child: child,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  }

  testWidgets('MarketCategoryTabBar fits across heights', (tester) async {
    const heights = [36.0, 50.0, 64.0, 80.0];

    for (final height in heights) {
      await pumpWithHeight(
        tester,
        height: height,
        child: MarketCategoryTabBar(
          selectedCategory: MarketCategory.indian,
          onSelected: (_) {},
        ),
      );
    }
  });

  testWidgets('MarketSegmentedControl fits across heights', (tester) async {
    const heights = [36.0, 48.0, 56.0, 72.0];

    for (final height in heights) {
      await pumpWithHeight(
        tester,
        height: height,
        child: MarketSegmentedControl(
          selectedSegment: MarketSegment.nseFutures,
          onSelected: (_) {},
        ),
      );
    }
  });
}
