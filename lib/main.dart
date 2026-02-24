import 'package:flutter/material.dart';
import 'package:barrel_annotation/barrel_annotation.dart';
import 'core/di/injection_container.dart';
import 'core/navigation/domain/app_navigator.dart';
import 'ui/ui.barrel.dart';

@BarrelConfig(exclude: [
  'lib/lib.barrel.dart',
  'lib/gen/**',
  'lib/**/*.g.dart',
  'lib/**/*.freezed.dart',
  'lib/**/*.config.dart',
])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appNavigator = getIt<AppNavigator>();

    return MaterialApp.router(
      title: 'Trading App Demo',
      theme: AppTheme.light,
      themeMode: ThemeMode.system,
      routerConfig: appNavigator.routerConfig,
    );
  }
}
