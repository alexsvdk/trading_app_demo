import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../models/app_routes.dart';
import '../../../features/main/presentation/main_screen.dart';
import '../../../features/market_watch/presentation/market_watch_screen.dart';
import '../../../features/portfolio/presentation/portfolio_screen.dart';
import '../../../features/orders/presentation/orders_screen.dart';
import '../../../features/positions/presentation/positions_screen.dart';

/// Factory class to create and configure the GoRouter
@singleton
class AppRouterFactory {
  AppRouterFactory();

  /// Creates and returns a configured GoRouter instance
  GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.defaultRoute.path,
      observers: [],
      routes: [
        // Main screen with bottom navigation
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainScreen(navigationShell: navigationShell);
          },
          branches: [
            // Market Watch (Home)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.marketWatch.path,
                  name: AppRoutes.marketWatch.name,
                  builder: (context, state) => const MarketWatchScreen(),
                ),
              ],
            ),

            // Portfolio
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.portfolio.path,
                  name: AppRoutes.portfolio.name,
                  builder: (context, state) => const PortfolioScreen(),
                ),
              ],
            ),

            // Orders
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.orders.path,
                  name: AppRoutes.orders.name,
                  builder: (context, state) => const OrdersScreen(),
                ),
              ],
            ),

            // Positions
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.positions.path,
                  name: AppRoutes.positions.name,
                  builder: (context, state) => const PositionsScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Page not found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Path: ${state.uri}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.defaultRoute.path),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
