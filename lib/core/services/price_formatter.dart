import 'package:injectable/injectable.dart';

@injectable
class PriceFormatter {
  String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  String formatPercentage(double percentage) {
    final sign = percentage >= 0 ? '+' : '';
    return '$sign${percentage.toStringAsFixed(2)}%';
  }
}
