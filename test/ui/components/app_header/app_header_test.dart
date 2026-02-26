import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/ui/components/app_header/app_header.dart';

void main() {
  group('AppHeader', () {
    const testBalance = '122200';
    const testNotificationCount = 10;

    testWidgets('should render all components', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.byType(AppHeader), findsOneWidget);
      expect(find.text('Market Watch'), findsOneWidget);
      expect(find.text('Balance'), findsOneWidget);
      expect(find.text(testBalance), findsOneWidget);
      expect(find.text(testNotificationCount.toString()), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('should call onMenuTap when menu button is tapped',
        (WidgetTester tester) async {
      bool menuTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: false,
              onMenuTap: () => menuTapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      expect(menuTapped, isTrue);
    });

    testWidgets('should call onWalletTap when wallet is tapped',
        (WidgetTester tester) async {
      bool walletTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: false,
              onWalletTap: () => walletTapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text(testBalance));
      expect(walletTapped, isTrue);
    });

    testWidgets('should call onNotificationTap when notification is tapped',
        (WidgetTester tester) async {
      bool notificationTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: false,
              onNotificationTap: () => notificationTapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.notifications));
      expect(notificationTapped, isTrue);
    });

    testWidgets('should have correct height in portrait',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: false,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppHeader),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.constraints?.minHeight, equals(90.0));
      expect(container.constraints?.maxHeight, equals(90.0));
    });

    testWidgets('should have correct height in landscape',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: true,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(AppHeader),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.constraints?.minHeight, equals(60.0));
      expect(container.constraints?.maxHeight, equals(60.0));
    });

    testWidgets('should not throw when callbacks are null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: testBalance,
              notificationCount: testNotificationCount,
              isLandscape: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.tap(find.text(testBalance));
      await tester.tap(find.byIcon(Icons.notifications));
    });
  });
}
