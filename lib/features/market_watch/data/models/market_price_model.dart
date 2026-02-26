import '../../domain/entities/market_contract_entity.dart';
import '../../domain/entities/market_price_entity.dart';

class MarketPriceModel extends MarketPriceEntity {
  const MarketPriceModel({
    required MarketContractEntity contract,
    required double price,
    required double change,
    required double percentChange,
  }) : super(
          contract: contract,
          price: price,
          change: change,
          percentChange: percentChange,
        );
}
