import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:trading_app_demo/ui/components/app_header/app_header.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Load fonts for golden tests
    await loadAppFonts();
  });

  group('AppHeader Golden Tests', () {
    testWidgets('AppHeader portrait with default values',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: '122200',
              notificationCount: 10,
              isLandscape: false,
            ),
          ),
        ),
        surfaceSize: const Size(390, 90),
      );

      await expectLater(
        find.byType(AppHeader),
        matchesGoldenFile('goldens/app_header_portrait_default.png'),
      );
    });

    testWidgets('AppHeader landscape with default values',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: '122200',
              notificationCount: 10,
              isLandscape: true,
            ),
          ),
        ),
        surfaceSize: const Size(844, 60),
      );

      await expectLater(
        find.byType(AppHeader),
        matchesGoldenFile('goldens/app_header_landscape_default.png'),
      );
    });

    testWidgets('AppHeader portrait with high balance',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: '999999',
              notificationCount: 10,
              isLandscape: false,
            ),
          ),
        ),
        surfaceSize: const Size(390, 90),
      );

      await expectLater(
        find.byType(AppHeader),
        matchesGoldenFile('goldens/app_header_portrait_high_balance.png'),
      );
    });

    testWidgets('AppHeader portrait with many notifications',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: '122200',
              notificationCount: 150,
              isLandscape: false,
            ),
          ),
        ),
        surfaceSize: const Size(390, 90),
      );

      await expectLater(
        find.byType(AppHeader),
        matchesGoldenFile('goldens/app_header_portrait_many_notifications.png'),
      );
    });

    testWidgets('AppHeader portrait with no notifications',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: '122200',
              notificationCount: 0,
              isLandscape: false,
            ),
          ),
        ),
        surfaceSize: const Size(390, 90),
      );

      await expectLater(
        find.byType(AppHeader),
        matchesGoldenFile('goldens/app_header_portrait_no_notifications.png'),
      );
    });

    testWidgets('AppHeader landscape with high balance',
        (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(
        const MaterialApp(
          home: Scaffold(
            body: AppHeader(
              balance: '999999',
              notificationCount: 10,
              isLandscape: true,
            ),
          ),
        ),
        surfaceSize: const Size(844, 60),
      );

      await expectLater(
        find.byType(AppHeader),
        matchesGoldenFile('goldens/app_header_landscape_high_balance.png'),
      );
    });
  });
}
