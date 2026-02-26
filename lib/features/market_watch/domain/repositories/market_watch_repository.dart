import '../entities/market_price_entity.dart';

abstract class MarketWatchRepository {
  Stream<List<MarketPriceEntity>> watchMarketPrices();
}
