enum AppRoutes {
  // Main Navigation
  marketWatch(path: '/'),
  portfolio(path: '/portfolio'),
  orders(path: '/orders'),
  positions(path: '/positions');

  static const defaultRoute = marketWatch;

  final String path;

  const AppRoutes({required this.path});

  String get lastPathSegment => path.split('/').last;

  static final pathMap = Map.fromEntries(
    values.map((e) => MapEntry(e.path, e)),
  );
}
