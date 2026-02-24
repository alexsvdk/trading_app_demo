import 'package:injectable/injectable.dart';

@injectable
class TradingService {
  String getCurrentPrice() {
    return '100.00';
  }

  double getPriceChange() {
    return 2.5;
  }
}
