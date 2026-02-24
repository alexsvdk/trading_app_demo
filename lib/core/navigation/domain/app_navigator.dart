import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app_router_factory.dart';
import '../models/app_routes.dart';

/// Provides convenient methods for app navigation
@singleton
class AppNavigator {
  final AppRouterFactory _appRouterFactory;

  late final _goRouter = _appRouterFactory.createRouter();

  /// Get the router configuration for MaterialApp.router
  RouterConfig<Object> get routerConfig => _goRouter;

  AppNavigator(this._appRouterFactory);

  /// Navigate to market watch (home)
  void goToMarketWatch() {
    _goRouter.go(AppRoutes.marketWatch.path);
  }

  /// Navigate to portfolio
  void goToPortfolio() {
    _goRouter.go(AppRoutes.portfolio.path);
  }

  /// Navigate to orders
  void goToOrders() {
    _goRouter.go(AppRoutes.orders.path);
  }

  /// Navigate to positions
  void goToPositions() {
    _goRouter.go(AppRoutes.positions.path);
  }

  /// Push market watch onto the navigation stack
  void pushMarketWatch() {
    _goRouter.push(AppRoutes.marketWatch.path);
  }

  /// Push portfolio onto the navigation stack
  void pushPortfolio() {
    _goRouter.push(AppRoutes.portfolio.path);
  }

  /// Push orders onto the navigation stack
  void pushOrders() {
    _goRouter.push(AppRoutes.orders.path);
  }

  /// Push positions onto the navigation stack
  void pushPositions() {
    _goRouter.push(AppRoutes.positions.path);
  }

  /// Navigate back
  void back() {
    if (_goRouter.canPop()) {
      _goRouter.pop();
    }
  }

  /// Navigate to home (default route)
  void goHome() {
    _goRouter.go(AppRoutes.defaultRoute.path);
  }

  /// Navigate to a specific path
  void go(String path) {
    _goRouter.go(path);
  }

  /// Push a specific path onto the navigation stack
  void push(String path) {
    _goRouter.push(path);
  }

  /// Check if we can pop
  bool canPop() {
    return _goRouter.canPop();
  }
}
