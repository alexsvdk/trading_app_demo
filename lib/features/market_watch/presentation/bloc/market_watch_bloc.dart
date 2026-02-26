import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/watch_market_prices_usecase.dart';
import 'market_watch_event.dart';
import 'market_watch_state.dart';
import '../models/market_watch_tabs.dart';

class MarketWatchBloc extends Bloc<MarketWatchEvent, MarketWatchState> {
  final WatchMarketPricesUseCase watchMarketPricesUseCase;
  StreamSubscription? _subscription;

  MarketWatchBloc({required this.watchMarketPricesUseCase})
      : super(const MarketWatchInitial()) {
    on<MarketWatchStarted>(_onStarted);
    on<MarketWatchPricesUpdated>(_onPricesUpdated);
    on<MarketWatchFailed>(_onFailed);
    on<MarketWatchCategorySelected>(_onCategorySelected);
    on<MarketWatchSegmentSelected>(_onSegmentSelected);
  }

  Future<void> _onStarted(
    MarketWatchStarted event,
    Emitter<MarketWatchState> emit,
  ) async {
    emit(const MarketWatchLoading());

    await _subscription?.cancel();
    _subscription = watchMarketPricesUseCase().listen(
      (prices) => add(MarketWatchPricesUpdated(prices)),
      onError: (error, _) => add(MarketWatchFailed(error.toString())),
    );
  }

  void _onPricesUpdated(
    MarketWatchPricesUpdated event,
    Emitter<MarketWatchState> emit,
  ) {
    final current = state;
    final category = current is MarketWatchLoaded
        ? current.category
        : MarketCategory.indian;
    final segment = current is MarketWatchLoaded
        ? current.segment
        : MarketSegment.nseFutures;

    emit(
      MarketWatchLoaded(
        event.prices,
        category: category,
        segment: segment,
      ),
    );
  }

  void _onFailed(
    MarketWatchFailed event,
    Emitter<MarketWatchState> emit,
  ) {
    emit(MarketWatchFailure(event.message));
  }

  void _onCategorySelected(
    MarketWatchCategorySelected event,
    Emitter<MarketWatchState> emit,
  ) {
    final current = state;
    if (current is MarketWatchLoaded) {
      emit(current.copyWith(category: event.category));
    }
  }

  void _onSegmentSelected(
    MarketWatchSegmentSelected event,
    Emitter<MarketWatchState> emit,
  ) {
    final current = state;
    if (current is MarketWatchLoaded) {
      emit(current.copyWith(segment: event.segment));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
