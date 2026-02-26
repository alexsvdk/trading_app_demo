import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../ui/components/components.barrel.dart';
import '../../../ui/theme/app_ui_constants.dart';
import '../../../core/di/injection_container.dart';
import '../../wallet/presentation/bloc/wallet_bloc.dart';
import '../../wallet/presentation/bloc/wallet_event.dart';
import '../../wallet/presentation/bloc/wallet_state.dart';

/// Market Watch Screen - Home screen showing trading contracts
class MarketWatchScreen extends StatelessWidget {
  const MarketWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletBloc>()..add(WalletStarted()),
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildContractListItem(context, index),
        childCount: 10, // Example: 10 contracts
      ),
    );
  }

  Widget _buildContractGrid(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 400, // Fixed height for demo
        child: ResponsiveGrid(
          children: List.generate(
            10,
            (index) => _buildContractCard(context, index),
          ),
        ),
      ),
    );
  }

  Widget _buildContractListItem(BuildContext context, int index) {
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
                  'NIFTY FUT',
                  style: AppUiConstants.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text('25 JAN', style: AppUiConstants.smallText),
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
                  (20000 + index * 100).toStringAsFixed(2),
                  style: AppUiConstants.priceText,
                ),
                const SizedBox(height: 4),
                Text(
                  '${index % 2 == 0 ? '+' : '-'}${(1.0 + index * 0.5).toStringAsFixed(2)}%',
                  style: index % 2 == 0
                      ? AppUiConstants.percentageChangePositive
                      : AppUiConstants.percentageChangeNegative,
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

  Widget _buildContractCard(BuildContext context, int index) {
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
                    'NIFTY FUT',
                    style: AppUiConstants.bodyText.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text('25 JAN', style: AppUiConstants.smallText),
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
                    (20000 + index * 100).toStringAsFixed(2),
                    style: AppUiConstants.priceText,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${index % 2 == 0 ? '+' : '-'}${(1.0 + index * 0.5).toStringAsFixed(2)}%',
                    style: index % 2 == 0
                        ? AppUiConstants.percentageChangePositive
                        : AppUiConstants.percentageChangeNegative,
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
