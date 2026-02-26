import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/components/components.barrel.dart';
import '../../../ui/theme/app_ui_constants.dart';
import '../../../core/di/injection_container.dart';
import 'bloc/market_watch_bloc.dart';
import 'bloc/market_watch_event.dart';
import 'bloc/market_watch_state.dart';
import '../../wallet/presentation/bloc/wallet_bloc.dart';
import '../../wallet/presentation/bloc/wallet_event.dart';
import '../../wallet/presentation/bloc/wallet_state.dart';
import '../../../core/services/price_formatter.dart';
import '../domain/entities/market_price_entity.dart';

/// Market Watch Screen - Home screen showing trading contracts
class MarketWatchScreen extends StatelessWidget {
  const MarketWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletBloc>()..add(WalletStarted()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<MarketWatchBloc>()..add(const MarketWatchStarted()),
          ),
        ],
        child: Scaffold(
          body: OrientationBuilder(
            builder: (context, orientation) {
              final isLandscape = orientation == Orientation.landscape;

              return CustomScrollView(
                slivers: [
                  // Header
                  SliverToBoxAdapter(child: _buildHeader(context, isLandscape)),

                  // Market Category Tabs
                  SliverToBoxAdapter(
                    child: _buildMarketTabs(context, isLandscape),
                  ),

                  // Search Bar
                  SliverToBoxAdapter(
                    child: _buildSearchBar(context, isLandscape),
                  ),

                  // Section Header
                  SliverToBoxAdapter(child: _buildSectionHeader(context)),

                  // Contract List (Grid in landscape, List in portrait)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppUiConstants.screenPadding,
                      vertical: AppUiConstants.smallSpacing,
                    ),
                    sliver:
                        isLandscape &&
                            AppUiConstants.calculateGridColumns(
                                  MediaQuery.widthOf(context) -
                                      2 * AppUiConstants.screenPadding,
                                ) >
                                1
                        ? _buildContractGrid(context)
                        : _buildContractList(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isLandscape) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        final balance = state is WalletLoaded ? state.wallet.balance : '122200';
        final notificationCount = state is WalletLoaded
            ? state.notifications.count
            : 10;

        return AppHeader(
          balance: balance,
          notificationCount: notificationCount,
          isLandscape: isLandscape,
          onMenuTap: () {
            // TODO: Implement menu action
          },
          onWalletTap: () {
            context.go('/portfolio');
          },
          onNotificationTap: () {
            // TODO: Implement notification action
          },
        );
      },
    );
  }

  Widget _buildMarketTabs(BuildContext context, bool isLandscape) {
    final tabBarHeight = AppUiConstants.getTabBarHeight(isLandscape);

    return Container(
      height: tabBarHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.screenPadding,
        vertical: AppUiConstants.smallSpacing,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTab(
            context,
            'Indian Market',
            'assets/images/tabs/indian_market.png',
            true,
          ),
          _buildTab(
            context,
            'International',
            'assets/images/tabs/International.png',
            false,
          ),
          _buildTab(
            context,
            'Forex Futures',
            'assets/images/tabs/forex.png',
            false,
          ),
          _buildTab(
            context,
            'Crypto Futures',
            'assets/images/tabs/crypto.png',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context,
    String label,
    String assetPath,
    bool isActive,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: AppUiConstants.elementSpacing),
      padding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.mediumSpacing,
        vertical: AppUiConstants.smallSpacing,
      ),
      decoration: isActive ? AppUiConstants.activeTabDecoration : null,
      child: Row(
        children: [
          Image.asset(
            assetPath,
            width: AppUiConstants.tabIconSize,
            height: AppUiConstants.tabIconSize,
            color: isActive
                ? AppUiConstants.whiteText
                : AppUiConstants.inactiveColor,
          ),
          const SizedBox(width: AppUiConstants.smallSpacing),
          Text(
            label,
            style: AppUiConstants.secondaryTextStyle.copyWith(
              color: isActive
                  ? AppUiConstants.whiteText
                  : AppUiConstants.inactiveColor,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, bool isLandscape) {
    final searchBarHeight = AppUiConstants.getSearchBarHeight(isLandscape);

    return Container(
      height: searchBarHeight,
      margin: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.screenPadding,
        vertical: AppUiConstants.smallSpacing,
      ),
      decoration: AppUiConstants.searchBarDecoration,
      padding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.mediumSpacing,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppUiConstants.inactiveColor,
            size: searchBarHeight * 0.6,
          ),
          const SizedBox(width: AppUiConstants.smallSpacing),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Nse Futures',
                hintStyle: AppUiConstants.secondaryTextStyle.copyWith(
                  color: AppUiConstants.inactiveColor,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.screenPadding,
        vertical: AppUiConstants.smallSpacing,
      ),
      child: Text('NSE Futures', style: AppUiConstants.mediumHeading),
    );
  }

  Widget _buildContractList(BuildContext context) {
    return BlocBuilder<MarketWatchBloc, MarketWatchState>(
      builder: (context, state) {
        if (state is MarketWatchLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  _buildContractListItem(context, state.prices[index]),
              childCount: state.prices.length,
            ),
          );
        }

        if (state is MarketWatchFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppUiConstants.screenPadding,
                vertical: AppUiConstants.smallSpacing,
              ),
              child: Text(state.message, style: AppUiConstants.smallText),
            ),
          );
        }

        return const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppUiConstants.screenPadding,
              vertical: AppUiConstants.smallSpacing,
            ),
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget _buildContractGrid(BuildContext context) {
    return BlocBuilder<MarketWatchBloc, MarketWatchState>(
      builder: (context, state) {
        if (state is MarketWatchLoaded) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 400, // Fixed height for demo
              child: ResponsiveGrid(
                children: List.generate(
                  state.prices.length,
                  (index) => _buildContractCard(context, state.prices[index]),
                ),
              ),
            ),
          );
        }

        if (state is MarketWatchFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppUiConstants.screenPadding,
                vertical: AppUiConstants.smallSpacing,
              ),
              child: Text(state.message, style: AppUiConstants.smallText),
            ),
          );
        }

        return const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppUiConstants.screenPadding,
              vertical: AppUiConstants.smallSpacing,
            ),
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget _buildContractListItem(
    BuildContext context,
    MarketPriceEntity price,
  ) {
    final formatter = getIt<PriceFormatter>();
    final changeStyle = price.isPositive
        ? AppUiConstants.percentageChangePositive
        : AppUiConstants.percentageChangeNegative;

    return Container(
      height: AppUiConstants.listItemHeight,
      decoration: AppUiConstants.listItemDecoration,
      padding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.screenPadding,
        vertical: AppUiConstants.mediumSpacing,
      ),
      child: Row(
        children: [
          // Contract Info
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price.contract.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppUiConstants.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(price.contract.expiry, style: AppUiConstants.smallText),
              ],
            ),
          ),
          // Price Info
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatter.formatPrice(price.price),
                  style: AppUiConstants.priceText,
                ),
                const SizedBox(height: 4),
                Text(
                  formatter.formatPercentage(price.percentChange),
                  style: changeStyle,
                ),
              ],
            ),
          ),
          // Chart Icon
          Icon(
            Icons.show_chart,
            color: AppUiConstants.chartIconColor,
            size: AppUiConstants.chartIconSize,
          ),
          const SizedBox(width: AppUiConstants.elementSpacing),
          // Buy Button
          _buildActionButton('BUY', AppUiConstants.buyButtonDecoration),
          const SizedBox(width: AppUiConstants.buttonSpacing),
          // Sell Button
          _buildActionButton('SELL', AppUiConstants.sellButtonDecoration),
        ],
      ),
    );
  }

  Widget _buildContractCard(
    BuildContext context,
    MarketPriceEntity price,
  ) {
    final formatter = getIt<PriceFormatter>();
    final changeStyle = price.isPositive
        ? AppUiConstants.percentageChangePositive
        : AppUiConstants.percentageChangeNegative;

    return Container(
      decoration: BoxDecoration(
        color: AppUiConstants.primaryBackground,
        borderRadius: BorderRadius.circular(AppUiConstants.cardBorderRadius),
        border: Border.all(color: AppUiConstants.lightBorder, width: 1),
      ),
      padding: const EdgeInsets.all(AppUiConstants.mediumSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Contract Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price.contract.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppUiConstants.bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(price.contract.expiry, style: AppUiConstants.smallText),
                ],
              ),
              Icon(
                Icons.show_chart,
                color: AppUiConstants.chartIconColor,
                size: AppUiConstants.chartIconSize,
              ),
            ],
          ),
          // Price and Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatter.formatPrice(price.price),
                    style: AppUiConstants.priceText,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    formatter.formatPercentage(price.percentChange),
                    style: changeStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  _buildActionButton('BUY', AppUiConstants.buyButtonDecoration),
                  const SizedBox(width: AppUiConstants.buttonSpacing),
                  _buildActionButton(
                    'SELL',
                    AppUiConstants.sellButtonDecoration,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, BoxDecoration decoration) {
    return Container(
      width: AppUiConstants.buttonWidth,
      height: AppUiConstants.buttonHeight,
      decoration: decoration,
      alignment: Alignment.center,
      child: Text(text, style: AppUiConstants.buttonText),
    );
  }
}
