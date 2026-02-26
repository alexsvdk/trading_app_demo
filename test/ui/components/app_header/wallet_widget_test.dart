import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/ui/components/app_header/wallet_widget.dart';

void main() {
  group('WalletWidget', () {
    const testBalance = '122200';

    testWidgets('should render balance label and amount',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WalletWidget(
              balance: testBalance,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.text('Balance'), findsOneWidget);
      expect(find.text(testBalance), findsOneWidget);
    });

    testWidgets('should call onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WalletWidget(
              balance: testBalance,
              onTap: () => tapped = true,
              isLandscape: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(WalletWidget));
      expect(tapped, isTrue);
    });

    testWidgets('should display correct balance value',
        (WidgetTester tester) async {
      const customBalance = '999999';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WalletWidget(
              balance: customBalance,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.text(customBalance), findsOneWidget);
    });

    testWidgets('should not throw when onTap is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WalletWidget(
              balance: testBalance,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(() => tester.tap(find.byType(WalletWidget)), returnsNormally);
    });

    testWidgets('should have correct text styles', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WalletWidget(
              balance: testBalance,
              isLandscape: false,
            ),
          ),
        ),
      );

      final labelFinder = find.text('Balance');
      final amountFinder = find.text(testBalance);

      final labelStyle = tester.widget<Text>(labelFinder).style;
      final amountStyle = tester.widget<Text>(amountFinder).style;

      expect(labelStyle?.fontSize, equals(12.0));
      expect(amountStyle?.fontSize, equals(16.0));
    });
  });
}
