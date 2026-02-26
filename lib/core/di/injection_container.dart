import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

// Wallet
import '../../features/wallet/data/services/mock_wallet_service.dart';
import '../../features/wallet/data/repositories/wallet_repository_impl.dart';
import '../../features/wallet/domain/repositories/wallet_repository.dart';
import '../../features/wallet/domain/usecases/get_balance_usecase.dart';
import '../../features/wallet/domain/usecases/get_notifications_usecase.dart';
import '../../features/wallet/presentation/bloc/wallet_bloc.dart';
// Market Watch
import '../../features/market_watch/data/repositories/market_watch_repository_impl.dart';
import '../../features/market_watch/domain/repositories/market_watch_repository.dart';
import '../../features/market_watch/domain/usecases/watch_market_prices_usecase.dart';
import '../../features/market_watch/presentation/bloc/market_watch_bloc.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  
  // Manual registrations for wallet components
  getIt.registerLazySingleton<MockWalletService>(() => MockWalletService());
  getIt.registerLazySingleton<WalletRepository>(() => WalletRepositoryImpl(getIt<MockWalletService>()));
  getIt.registerFactory<GetBalanceUseCase>(() => GetBalanceUseCase(getIt<WalletRepository>()));
  getIt.registerFactory<GetNotificationsUseCase>(() => GetNotificationsUseCase(getIt<WalletRepository>()));
  getIt.registerFactory<WalletBloc>(() => WalletBloc(
    getBalanceUseCase: getIt<GetBalanceUseCase>(),
    getNotificationsUseCase: getIt<GetNotificationsUseCase>(),
  ));

  // Manual registrations for market watch components
  getIt.registerLazySingleton<MarketWatchRepository>(() => MarketWatchRepositoryImpl());
  getIt.registerFactory<WatchMarketPricesUseCase>(() => WatchMarketPricesUseCase(getIt<MarketWatchRepository>()));
  getIt.registerFactory<MarketWatchBloc>(() => MarketWatchBloc(
    watchMarketPricesUseCase: getIt<WatchMarketPricesUseCase>(),
  ));
}
