import 'package:equatable/equatable.dart';

import '../../domain/entities/market_price_entity.dart';
import '../models/market_watch_tabs.dart';

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
  final MarketCategory category;
  final MarketSegment segment;

  const MarketWatchLoaded(
    this.prices, {
    required this.category,
    required this.segment,
  });

  MarketWatchLoaded copyWith({
    List<MarketPriceEntity>? prices,
    MarketCategory? category,
    MarketSegment? segment,
  }) {
    return MarketWatchLoaded(
      prices ?? this.prices,
      category: category ?? this.category,
      segment: segment ?? this.segment,
    );
  }

  @override
  List<Object?> get props => [prices, category, segment];
}

class MarketWatchFailure extends MarketWatchState {
  final String message;

  const MarketWatchFailure(this.message);

  @override
  List<Object?> get props => [message];
}
