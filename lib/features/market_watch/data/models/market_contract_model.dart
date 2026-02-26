import '../../domain/entities/market_contract_entity.dart';

class MarketContractModel extends MarketContractEntity {
  const MarketContractModel({
    required super.symbol,
    required super.name,
    required super.expiry,
  });
}
