import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trading_app_demo/features/market_watch/domain/entities/market_contract_entity.dart';
import 'package:trading_app_demo/features/market_watch/domain/entities/market_price_entity.dart';
import 'package:trading_app_demo/features/market_watch/domain/repositories/market_watch_repository.dart';
import 'package:trading_app_demo/features/market_watch/domain/usecases/watch_market_prices_usecase.dart';

class MockMarketWatchRepository extends Mock
    implements MarketWatchRepository {}

void main() {
  late MockMarketWatchRepository repository;
  late WatchMarketPricesUseCase useCase;
  late StreamController<List<MarketPriceEntity>> controller;

  setUp(() {
    repository = MockMarketWatchRepository();
    useCase = WatchMarketPricesUseCase(repository);
    controller = StreamController<List<MarketPriceEntity>>.broadcast();
  });

  tearDown(() async {
    await controller.close();
  });

  test('requests stream from repository', () {
    when(() => repository.watchMarketPrices())
        .thenAnswer((_) => controller.stream);

    useCase();

    verify(() => repository.watchMarketPrices()).called(1);
  });

  test('forwards emitted prices', () async {
    when(() => repository.watchMarketPrices())
        .thenAnswer((_) => controller.stream);

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

    expectLater(useCase(), emitsInOrder([prices]));

    controller.add(prices);
  });
}
