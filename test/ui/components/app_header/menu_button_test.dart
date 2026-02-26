import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/ui/components/app_header/menu_button.dart';

void main() {
  group('MenuButton', () {
    testWidgets('should render menu icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuButton(
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should call onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              onTap: () => tapped = true,
              isLandscape: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(MenuButton));
      expect(tapped, isTrue);
    });

    testWidgets('should have correct icon size in portrait',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuButton(
              isLandscape: false,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.menu));
      expect(icon.size, equals(24.0));
    });

    testWidgets('should have correct icon size in landscape',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuButton(
              isLandscape: true,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.menu));
      expect(icon.size, equals(20.0));
    });

    testWidgets('should not throw when onTap is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MenuButton(
              isLandscape: false,
            ),
          ),
        ),
      );

      expect(() => tester.tap(find.byType(MenuButton)), returnsNormally);
    });
  });
}
