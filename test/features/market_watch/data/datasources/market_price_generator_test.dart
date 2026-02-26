import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/features/market_watch/data/datasources/market_price_generator.dart';
import 'package:trading_app_demo/features/market_watch/domain/entities/market_contract_entity.dart';

void main() {
  test('emits initial prices for all contracts', () async {
    final generator = MarketPriceGenerator(
      contracts: const [
        MarketContractEntity(symbol: 'NIFTY', name: 'NIFTY FUT', expiry: '25 JAN'),
        MarketContractEntity(symbol: 'BANKNIFTY', name: 'BANKNIFTY FUT', expiry: '25 JAN'),
      ],
      random: Random(42),
      updateInterval: const Duration(milliseconds: 10),
    );

    final stream = generator.stream();

    final first = await stream.first;

    expect(first.length, 2);
    expect(first[0].price, greaterThan(0));
    expect(first[1].price, greaterThan(0));
  });

  test('updates prices with +/-1..5 percent changes', () async {
    final generator = MarketPriceGenerator(
      contracts: const [
        MarketContractEntity(symbol: 'NIFTY', name: 'NIFTY FUT', expiry: '25 JAN'),
      ],
      random: Random(1),
      updateInterval: const Duration(milliseconds: 10),
    );

    final stream = generator.stream();
    final events = await stream.take(3).toList();

    // Skip initial event, verify percent change bounds on update events.
    for (var i = 1; i < events.length; i++) {
      final percent = events[i].first.percentChange.abs();
      expect(percent, inInclusiveRange(1, 5));
    }
  });
}
