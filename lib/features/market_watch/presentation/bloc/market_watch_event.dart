import 'package:equatable/equatable.dart';

import '../../domain/entities/market_price_entity.dart';
import '../models/market_watch_tabs.dart';

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

class MarketWatchCategorySelected extends MarketWatchEvent {
  final MarketCategory category;

  const MarketWatchCategorySelected(this.category);

  @override
  List<Object?> get props => [category];
}

class MarketWatchSegmentSelected extends MarketWatchEvent {
  final MarketSegment segment;

  const MarketWatchSegmentSelected(this.segment);

  @override
  List<Object?> get props => [segment];
}
