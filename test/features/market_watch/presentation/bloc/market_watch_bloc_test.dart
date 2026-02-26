import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trading_app_demo/features/market_watch/domain/entities/market_contract_entity.dart';
import 'package:trading_app_demo/features/market_watch/domain/entities/market_price_entity.dart';
import 'package:trading_app_demo/features/market_watch/domain/usecases/watch_market_prices_usecase.dart';
import 'package:trading_app_demo/features/market_watch/presentation/bloc/market_watch_bloc.dart';
import 'package:trading_app_demo/features/market_watch/presentation/bloc/market_watch_event.dart';
import 'package:trading_app_demo/features/market_watch/presentation/bloc/market_watch_state.dart';

class MockWatchMarketPricesUseCase extends Mock
    implements WatchMarketPricesUseCase {}

void main() {
  late MarketWatchBloc bloc;
  late MockWatchMarketPricesUseCase mockUseCase;
  late StreamController<List<MarketPriceEntity>> controller;

  final contract = MarketContractEntity(
    symbol: 'NIFTY',
    name: 'NIFTY FUT',
    expiry: '25 JAN',
  );

  final prices = [
    MarketPriceEntity(
      contract: contract,
      price: 20000,
      change: 0,
      percentChange: 0,
    ),
  ];

  setUp(() {
    mockUseCase = MockWatchMarketPricesUseCase();
    controller = StreamController<List<MarketPriceEntity>>.broadcast();
    when(() => mockUseCase()).thenAnswer((_) => controller.stream);
    bloc = MarketWatchBloc(watchMarketPricesUseCase: mockUseCase);
  });

  tearDown(() async {
    await controller.close();
    await bloc.close();
  });

  test('initial state is MarketWatchInitial', () {
    expect(bloc.state, equals(const MarketWatchInitial()));
  });

  test('emits loading then loaded when prices arrive', () async {
    final expected = [
      const MarketWatchLoading(),
      MarketWatchLoaded(prices),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    bloc.add(const MarketWatchStarted());
    await Future.delayed(Duration.zero);
    controller.add(prices);
  });

  test('emits failure on stream error', () async {
    final expected = [
      const MarketWatchLoading(),
      isA<MarketWatchFailure>(),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    bloc.add(const MarketWatchStarted());
    await Future.delayed(Duration.zero);
    controller.addError(Exception('boom'));
  });
}
