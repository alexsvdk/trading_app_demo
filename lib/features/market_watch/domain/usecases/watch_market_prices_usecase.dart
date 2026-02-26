import '../entities/market_price_entity.dart';
import '../repositories/market_watch_repository.dart';

class WatchMarketPricesUseCase {
  final MarketWatchRepository repository;

  WatchMarketPricesUseCase(this.repository);

  Stream<List<MarketPriceEntity>> call() {
    return repository.watchMarketPrices();
  }
}
