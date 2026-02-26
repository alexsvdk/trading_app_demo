import 'package:equatable/equatable.dart';

import '../../domain/entities/market_price_entity.dart';

abstract class MarketWatchEvent extends Equatable {
  const MarketWatchEvent();

  @override
  List<Object?> get props => [];
}

class MarketWatchStarted extends MarketWatchEvent {
  const MarketWatchStarted();
}

class MarketWatchPricesUpdated extends MarketWatchEvent {
  final List<MarketPriceEntity> prices;

  const MarketWatchPricesUpdated(this.prices);

  @override
  List<Object?> get props => [prices];
}

class MarketWatchFailed extends MarketWatchEvent {
  final String message;

  const MarketWatchFailed(this.message);

  @override
  List<Object?> get props => [message];
}
