import 'dart:async';
import 'dart:math';

import '../../../../ui/theme/app_theme.dart';
import '../../domain/entities/market_contract_entity.dart';
import '../../domain/entities/market_price_entity.dart';
import '../models/market_price_model.dart';

class MarketPriceGenerator {
  MarketPriceGenerator({
    required List<MarketContractEntity> contracts,
    Random? random,
    Duration? updateInterval,
  })  : _contracts = contracts,
        _random = random ?? Random(),
        _updateInterval = updateInterval ?? AppDurations.priceUpdate;

  final List<MarketContractEntity> _contracts;
  final Random _random;
  final Duration _updateInterval;

  final Map<String, double> _prices = {};
  Timer? _timer;
  StreamController<List<MarketPriceEntity>>? _controller;

  Stream<List<MarketPriceEntity>> stream() {
    _controller ??= StreamController<List<MarketPriceEntity>>.broadcast(
      onListen: _start,
      onCancel: _handleCancel,
    );
    return _controller!.stream;
  }

  void _start() {
    _seedPricesIfNeeded();
    _emitInitial();
    _timer ??= Timer.periodic(_updateInterval, (_) => _tick());
  }

  void _handleCancel() {
    if (!(_controller?.hasListener ?? false)) {
      _timer?.cancel();
      _timer = null;
    }
  }

  void _seedPricesIfNeeded() {
    if (_prices.isNotEmpty) {
      return;
    }

    for (var index = 0; index < _contracts.length; index++) {
      final contract = _contracts[index];
      _prices[contract.symbol] = 20000 + index * 120;
    }
  }

  void _emitInitial() {
    final initial = _contracts.map((contract) {
      final price = _prices[contract.symbol] ?? 0;
      return MarketPriceModel(
        contract: contract,
        price: price,
        change: 0,
        percentChange: 0,
      );
    }).toList();

    _controller?.add(initial);
  }

  void _tick() {
    final updated = <MarketPriceEntity>[];

    for (final contract in _contracts) {
      final current = _prices[contract.symbol] ?? 0;
      final delta = 1 + _random.nextDouble() * 4;
      final signedPercent = _random.nextBool() ? delta : -delta;
      final next = current * (1 + signedPercent / 100);

      _prices[contract.symbol] = next;

      updated.add(
        MarketPriceModel(
          contract: contract,
          price: next,
          change: next - current,
          percentChange: signedPercent,
        ),
      );
    }

    _controller?.add(updated);
  }
}
