import '../../domain/entities/market_contract_entity.dart';
import '../../domain/entities/market_price_entity.dart';
import '../../domain/repositories/market_watch_repository.dart';
import '../datasources/market_price_generator.dart';
import '../models/market_contract_model.dart';

class MarketWatchRepositoryImpl implements MarketWatchRepository {
  MarketWatchRepositoryImpl({MarketPriceGenerator? generator})
    : _generator =
      generator ?? MarketPriceGenerator(contracts: _defaultContracts);
  final MarketPriceGenerator _generator;

  static const List<MarketContractEntity> _defaultContracts = [
    MarketContractModel(symbol: 'NIFTY', name: 'NIFTY FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'BANKNIFTY', name: 'BANKNIFTY FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'SENSEX', name: 'SENSEX FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'FINNIFTY', name: 'FINNIFTY FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'MIDCPNIFTY', name: 'MIDCPNIFTY FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'NIFTYIT', name: 'NIFTY IT FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'NIFTYAUTO', name: 'NIFTY AUTO FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'NIFTYMETAL', name: 'NIFTY METAL FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'NIFTYPHARMA', name: 'NIFTY PHARMA FUT', expiry: '25 JAN'),
    MarketContractModel(symbol: 'NIFTYFMCG', name: 'NIFTY FMCG FUT', expiry: '25 JAN'),
  ];

  @override
  Stream<List<MarketPriceEntity>> watchMarketPrices() {
    return _generator.stream();
  }
}
