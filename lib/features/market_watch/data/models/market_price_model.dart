import '../../domain/entities/market_price_entity.dart';

class MarketPriceModel extends MarketPriceEntity {
  const MarketPriceModel({
    required super.contract,
    required super.price,
    required super.change,
    required super.percentChange,
  });
}
