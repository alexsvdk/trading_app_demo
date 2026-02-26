import 'package:equatable/equatable.dart';

import 'market_contract_entity.dart';

class MarketPriceEntity extends Equatable {
  final MarketContractEntity contract;
  final double price;
  final double change;
  final double percentChange;

  const MarketPriceEntity({
    required this.contract,
    required this.price,
    required this.change,
    required this.percentChange,
  });

  bool get isPositive => percentChange >= 0;

  @override
  List<Object> get props => [contract, price, change, percentChange];
}
