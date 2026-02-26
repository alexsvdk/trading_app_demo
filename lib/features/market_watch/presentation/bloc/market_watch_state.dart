import 'package:equatable/equatable.dart';

import '../../domain/entities/market_price_entity.dart';

abstract class MarketWatchState extends Equatable {
  const MarketWatchState();

  @override
  List<Object?> get props => [];
}

class MarketWatchInitial extends MarketWatchState {
  const MarketWatchInitial();
}

class MarketWatchLoading extends MarketWatchState {
  const MarketWatchLoading();
}

class MarketWatchLoaded extends MarketWatchState {
  final List<MarketPriceEntity> prices;

  const MarketWatchLoaded(this.prices);

  @override
  List<Object?> get props => [prices];
}

class MarketWatchFailure extends MarketWatchState {
  final String message;

  const MarketWatchFailure(this.message);

  @override
  List<Object?> get props => [message];
}
