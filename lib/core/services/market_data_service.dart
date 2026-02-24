import 'package:injectable/injectable.dart';

@injectable
class MarketDataService {
  List<String> getAvailableMarkets() {
    return ['AAPL', 'GOOGL', 'MSFT', 'AMZN', 'TSLA'];
  }

  Map<String, double> getMarketPrices() {
    return {
      'AAPL': 178.50,
      'GOOGL': 141.80,
      'MSFT': 378.90,
      'AMZN': 178.25,
      'TSLA': 248.50,
    };
  }
}
