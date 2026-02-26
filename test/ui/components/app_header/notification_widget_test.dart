import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/ui/components/app_header/notification_widget.dart';

void main() {
  group('NotificationWidget', () {
    testWidgets('should render notification icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 10,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('should render badge when count > 0',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 10,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('should not render badge when count is 0',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 0,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.text('0'), findsNothing);
    });

    testWidgets('should display 99+ when count > 99',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 150,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.text('99+'), findsOneWidget);
      expect(find.text('150'), findsNothing);
    });

    testWidgets('should call onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 10,
              onTap: () => tapped = true,
              isLandscape: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NotificationWidget));
      expect(tapped, isTrue);
    });

    testWidgets('should have correct icon size in portrait',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 10,
              isLandscape: false,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.notifications));
      expect(icon.size, equals(24.0));
    });

    testWidgets('should have correct icon size in landscape',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 10,
              isLandscape: true,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.notifications));
      expect(icon.size, equals(20.0));
    });

    testWidgets('should not throw when onTap is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NotificationWidget(
              count: 10,
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(() => tester.tap(find.byType(NotificationWidget)),
          returnsNormally);
    });
  });
}
