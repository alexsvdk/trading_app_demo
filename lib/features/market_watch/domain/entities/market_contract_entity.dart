import 'package:equatable/equatable.dart';

class MarketContractEntity extends Equatable {
  final String symbol;
  final String name;
  final String expiry;

  const MarketContractEntity({
    required this.symbol,
    required this.name,
    required this.expiry,
  });

  @override
  List<Object> get props => [symbol, name, expiry];
}
