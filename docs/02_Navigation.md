# Go Router Navigation Quick Reference

## Quick Start

### 1. Navigate to a Screen

```dart
// Using AppNavigator (recommended)
final appNavigator = getIt<AppNavigator>();
appNavigator.goToPortfolio();

// Using GoRouter directly
context.go('/portfolio');
```

### 2. Navigate Back

```dart
// Using AppNavigator
appNavigator.back();

// Using GoRouter
context.pop();
```

### 3. Check if Can Pop

```dart
if (appNavigator.canPop()) {
  appNavigator.back();
}
```

### 4. Get Current Route

```dart
// Using GoRouter directly in a widget
final location = GoRouterState.of(context).uri.toString();
print(location); // e.g., '/portfolio'
```

## Available Routes

| Route | Path | Method |
|-------|------|--------|
| Market Watch | `/` | `goToMarketWatch()` |
| Portfolio | `/portfolio` | `goToPortfolio()` |
| Orders | `/orders` | `goToOrders()` |
| Positions | `/positions` | `goToPositions()` |

## Navigation Methods

### Go (Replace Current Route)
```dart
appNavigator.goToPortfolio();  // No back button to previous
```

### Push (Add to Stack)
```dart
appNavigator.pushPortfolio();  // Can go back
```

## Adding a New Route

### Step 1: Add to AppRoutes Enum
```dart
// lib/core/navigation/models/app_routes.dart
enum AppRoutes {
  // ... existing routes
  settings(path: '/settings'),
}
```

### Step 2: Add Route Configuration
```dart
// lib/core/navigation/domain/app_router_factory.dart
StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoutes.settings.path,
      name: AppRoutes.settings.name,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
),
```

### Step 3: Add Navigation Method
```dart
// lib/core/navigation/domain/app_navigator.dart
void goToSettings() {
  _goRouter.go(AppRoutes.settings.path);
}

void pushSettings() {
  _goRouter.push(AppRoutes.settings.path);
}
```

### Step 4: Create Screen
```dart
// lib/features/settings/presentation/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Screen')),
    );
  }
}
```

## Route Parameters

### Query Parameters
```dart
// Navigate
context.go('/article?id=123&title=My%20Article');

// Access
final id = GoRouterState.of(context).uri.queryParameters['id'];
final title = GoRouterState.of(context).uri.queryParameters['title'];
```

### Path Parameters
```dart
// Define route
GoRoute(
  path: '/article/:id',
  builder: (context, state) {
    final id = state.pathParameters['id'];
    return ArticleScreen(id: id!);
  },
),

// Navigate
context.go('/article/123');
```

## Common Patterns

### Navigate with Callback
```dart
ElevatedButton(
  onPressed: () => appNavigator.goToPortfolio(),
  child: const Text('Go to Portfolio'),
)
```

### Navigate on App Bar Action
```dart
AppBar(
  title: const Text('Home'),
  actions: [
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () => appNavigator.goToSettings(),
    ),
  ],
)
```

### Navigate with Confirmation
```dart
ElevatedButton(
  onPressed: () async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      appNavigator.goToPortfolio();
    }
  },
  child: const Text('Go to Portfolio'),
)
```

## Error Handling

### Unknown Route
The router automatically handles unknown routes with an error screen. To customize:

```dart
// lib/core/navigation/domain/app_router_factory.dart
errorBuilder: (context, state) => Scaffold(
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 64, color: Colors.red),
        const SizedBox(height: 16),
        Text('Page not found'),
        const SizedBox(height: 8),
        Text('Path: ${state.uri}'),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => context.go(AppRoutes.defaultRoute.path),
          child: const Text('Go Home'),
        ),
      ],
    ),
  ),
),
```

## Testing Navigation

```dart
test('Navigate to portfolio', () {
  final appNavigator = getIt<AppNavigator>();
  appNavigator.goToPortfolio();
  expect(getIt<CurrentRouteHolder>().currentPath, '/portfolio');
});

test('Navigate back', () {
  final appNavigator = getIt<AppNavigator>();
  appNavigator.goToPortfolio();
  appNavigator.back();
  expect(getIt<CurrentRouteHolder>().currentPath, '/');
});
```

## Best Practices

1. ✅ Use `AppNavigator` methods for type safety
2. ✅ Define all routes in `AppRoutes` enum
3. ✅ Use descriptive route names
4. ✅ Handle errors gracefully
5. ✅ Keep navigation logic in `AppNavigator`
6. ✅ Use dependency injection to access `AppNavigator`
7. ❌ Don't use hardcoded paths
8. ❌ Don't scatter navigation code throughout the app

## Troubleshooting

### Route not found
- Check route is defined in `AppRoutes` enum
- Verify route is added to `AppRouterFactory`
- Ensure path matches exactly

### Navigation not working
- Check dependencies are registered in `injection_container.dart`
- Verify `configureDependencies()` is called in `main()`
- Ensure router is passed to `MaterialApp.router`

### State not preserved
- Use `StatefulShellRoute` for bottom navigation
- Don't use `go()` for tab switches, use `goBranch()`

---

# Go Router Navigation Documentation

This document explains how to use the Go Router navigation system in the Trading App Demo, which is implemented using `injectable` with `get_it` for dependency injection (similar to the reference project but with injectable instead of Riverpod).

## Architecture Overview

The navigation system follows Clean Architecture principles with the following components:

### Core Components

1. **AppRoutes** (`lib/core/navigation/models/app_routes.dart`)
   - Enum defining all application routes
   - Provides route paths and metadata
   - Example: `AppRoutes.marketWatch`, `AppRoutes.portfolio`

2. **AppRouterFactory** (`lib/core/navigation/domain/app_router_factory.dart`)
   - Factory class that creates and configures the GoRouter instance
   - Defines all route configurations
   - Includes error handling for unknown routes
   - Annotated with `@singleton` for injectable DI

3. **AppNavigator** (`lib/core/navigation/domain/app_navigator.dart`)
   - Provides convenient methods for navigation
   - Wraps GoRouter functionality with type-safe methods
   - Example: `appNavigator.goToPortfolio()`, `appNavigator.back()`

## Dependency Injection

All navigation dependencies are registered using `injectable` annotations:

### AppRouterFactory
```dart
@singleton
class AppRouterFactory {
  AppRouterFactory();
  // ...
}
```

### AppNavigator
```dart
@singleton
class AppNavigator {
  final AppRouterFactory _appRouterFactory;

  AppNavigator(this._appRouterFactory);
  // ...
}
```

The dependencies are automatically registered by running:
```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

This generates the configuration in `lib/core/di/injection_container.config.dart`, which is then initialized in `main.dart`:

```dart
await configureDependencies();
```

## Usage Examples

### 1. Basic Navigation

```dart
// Get the AppNavigator instance
final appNavigator = getIt<AppNavigator>();

// Navigate to different screens
appNavigator.goToMarketWatch();  // Home
appNavigator.goToPortfolio();
appNavigator.goToOrders();
appNavigator.goToPositions();

// Navigate back
appNavigator.back();

// Navigate to home
appNavigator.goHome();
```

### 2. Push vs Go

```dart
// Go - replaces the current route (no back button to previous)
appNavigator.goToPortfolio();

// Push - adds to the navigation stack (can go back)
appNavigator.pushPortfolio();
```

### 3. Using GoRouter Directly

If you need more control, you can use GoRouter directly:

```dart
import 'package:go_router/go_router.dart';

// In a widget build method
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.go('/portfolio'),
      child: Text('Go to Portfolio'),
    );
  }
}
```

### 4. Accessing Current Route

```dart
// Access current route in a widget
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    print('Current route: $location');
    return Text('Current: $location');
  }
}

// Or use GoRouter.of(context) for more control
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    print('Current route: ${router.routeInformationProvider.value.uri}');
    return Text('Current: ${router.routeInformationProvider.value.uri}');
  }
}
```

### 5. Adding New Routes

To add a new route:

1. **Add to AppRoutes enum** (`lib/core/navigation/models/app_routes.dart`):

```dart
enum AppRoutes {
  // ... existing routes
  settings(path: '/settings'),
  profile(path: '/profile'),
}
```

2. **Add route configuration** (`lib/core/navigation/domain/app_router_factory.dart`):

```dart
GoRoute(
  path: AppRoutes.settings.path,
  name: AppRoutes.settings.name,
  builder: (context, state) => const SettingsScreen(),
),
```

3. **Add navigation method** (`lib/core/navigation/domain/app_navigator.dart`):

```dart
void goToSettings() {
  _goRouter.go(AppRoutes.settings.path);
}

void pushSettings() {
  _goRouter.push(AppRoutes.settings.path);
}
```

4. **Create the screen** (e.g., `lib/features/settings/presentation/settings_screen.dart`):

```dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Screen')),
    );
  }
}
```

## Route Parameters

### Query Parameters

```dart
// Navigate with query parameters
appNavigator.push('/article?id=123&title=My%20Article');

// Access parameters in the screen
class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).uri.queryParameters['id'];
    final title = GoRouterState.of(context).uri.queryParameters['title'];
    // ...
  }
}
```

### Path Parameters

```dart
// Define route with path parameter
GoRoute(
  path: '/article/:id',
  builder: (context, state) {
    final id = state.pathParameters['id'];
    return ArticleScreen(id: id!);
  },
),

// Navigate with path parameter
context.go('/article/123');
```

## Error Handling

The router includes an error builder for unknown routes:

```dart
errorBuilder: (context, state) => Scaffold(
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 64, color: Colors.red),
        const SizedBox(height: 16),
        Text('Page not found'),
        const SizedBox(height: 8),
        Text('Path: ${state.uri}'),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => context.go(AppRoutes.defaultRoute.path),
          child: const Text('Go Home'),
        ),
      ],
    ),
  ),
),
```

## Best Practices

1. **Use AppNavigator methods** instead of direct GoRouter calls for type safety
2. **Define all routes in AppRoutes enum** for centralized route management
3. **Use descriptive route names** that match the screen purpose
4. **Handle errors gracefully** with the error builder
5. **Keep navigation logic in AppNavigator** to avoid scattered navigation code
6. **Use dependency injection** to access AppNavigator throughout the app

## Comparison with Reference Project

The reference project (`era_of_cahange_app`) uses Riverpod for dependency injection:

```dart
// Reference project (Riverpod)
static final appNavigator = Provider(
  (ref) => AppNavigator(ref.watch(_appRouterFactory)),
);

// Usage
final appNavigator = ref.watch(NavigationDi.appNavigator);
```

This project uses injectable with get_it:

```dart
// This project (injectable + get_it)
@singleton
class AppNavigator {
  final AppRouterFactory _appRouterFactory;

  AppNavigator(this._appRouterFactory);
  // ...
}

// Usage
final appNavigator = getIt<AppNavigator>();
```

The navigation architecture and patterns are identical, only the DI framework differs.

## Testing

To test navigation:

```dart
test('Navigate to portfolio', () {
  final appNavigator = getIt<AppNavigator>();
  appNavigator.goToPortfolio();
  // Verify navigation occurred
});
```

## Troubleshooting

### Route not found
- Ensure the route is defined in `AppRoutes` enum
- Check that the route is added to `AppRouterFactory.createRouter()`
- Verify the path matches exactly

### Navigation not working
- Ensure dependencies are registered with `@singleton` annotations
- Check that `configureDependencies()` is called in `main()`
- Verify the router is passed to `MaterialApp.router`
- Run `fvm dart run build_runner build --delete-conflicting-outputs` to generate DI config

## Additional Resources

- [Go Router Documentation](https://pub.dev/packages/go_router)
- [get_it Documentation](https://pub.dev/packages/get_it)
- [injectable Documentation](https://pub.dev/packages/injectable)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
