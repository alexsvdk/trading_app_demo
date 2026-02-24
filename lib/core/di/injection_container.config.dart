// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:trading_app_demo/core/navigation/domain/app_navigator.dart'
    as _i689;
import 'package:trading_app_demo/core/navigation/domain/app_router_factory.dart'
    as _i626;
import 'package:trading_app_demo/core/services/market_data_service.dart'
    as _i99;
import 'package:trading_app_demo/core/services/price_formatter.dart' as _i299;
import 'package:trading_app_demo/core/services/trading_service.dart' as _i389;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i299.PriceFormatter>(() => _i299.PriceFormatter());
    gh.factory<_i99.MarketDataService>(() => _i99.MarketDataService());
    gh.factory<_i389.TradingService>(() => _i389.TradingService());
    gh.singleton<_i626.AppRouterFactory>(() => _i626.AppRouterFactory());
    gh.singleton<_i689.AppNavigator>(
      () => _i689.AppNavigator(gh<_i626.AppRouterFactory>()),
    );
    return this;
  }
}
