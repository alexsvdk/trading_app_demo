import 'package:flutter/material.dart';

import '../../theme/app_ui_constants.dart';
import '../../../gen/assets.gen.dart';
import '../../../features/market_watch/presentation/models/market_watch_tabs.dart';

class MarketCategoryTabBar extends StatelessWidget {
  final MarketCategory selectedCategory;
  final ValueChanged<MarketCategory> onSelected;

  const MarketCategoryTabBar({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : AppUiConstants.tabBarHeight + AppUiConstants.smallSpacing * 2;
        final verticalPadding = (maxHeight * 0.12).clamp(
          4.0,
          AppUiConstants.smallSpacing,
        );
        final availableHeight = maxHeight - verticalPadding * 2;
        final tabHeight = availableHeight <= 0
            ? 0.0
            : availableHeight.clamp(0.0, AppUiConstants.tabBarHeight);

        return Container(
          decoration: AppUiConstants.headerDecoration,
          padding: EdgeInsets.only(
            left: AppUiConstants.screenPadding,
            right: AppUiConstants.screenPadding,
            top: verticalPadding,
          ),
          child: SizedBox(
            height: tabHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: MarketCategory.values
                  .map(
                    (category) => _MarketCategoryTabItem(
                      category: category,
                      isActive: category == selectedCategory,
                      onTap: () => onSelected(category),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _MarketCategoryTabItem extends StatelessWidget {
  final MarketCategory category;
  final bool isActive;
  final VoidCallback onTap;

  const _MarketCategoryTabItem({
    required this.category,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : AppUiConstants.tabBarHeight;
        final underlineHeight = AppUiConstants.tabBarUnderlineHeight.clamp(
          2.0,
          maxHeight,
        );
        final contentHeight = (maxHeight - underlineHeight).clamp(
          0.0,
          maxHeight,
        );
        final iconSize = (contentHeight * 0.55).clamp(
          0.0,
          AppUiConstants.tabBarIconSize,
        );
        final spacing = (contentHeight * 0.2).clamp(2.0, 8.0);

        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppUiConstants.tabBorderRadius),
          child: Container(
            width: AppUiConstants.tabBarItemWidth,
            margin: const EdgeInsets.only(right: AppUiConstants.elementSpacing),
            height: maxHeight,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: contentHeight,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedScale(
                            scale: isActive
                                ? AppUiConstants.tabBarActiveIconScale
                                : 1.0,
                            duration: AppUiConstants.tabBarIconAnimDuration,
                            curve: AppUiConstants.tabBarIconAnimCurve,
                            child: _buildIcon(iconSize),
                          ),
                          SizedBox(height: spacing),
                          AnimatedDefaultTextStyle(
                            duration: AppUiConstants.tabBarIconAnimDuration,
                            curve: AppUiConstants.tabBarIconAnimCurve,
                            style: isActive
                                ? AppUiConstants.tabBarActiveLabel
                                : AppUiConstants.tabBarInactiveLabel,
                            child: Text(
                              category.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: AppUiConstants.tabBarUnderlineWidth,
                    height: underlineHeight,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppUiConstants.activeTabUnderline
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(underlineHeight),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIcon(double size) {
    final image = switch (category) {
      MarketCategory.indian => Assets.images.tabs.indianMarket,
      MarketCategory.international => Assets.images.tabs.international,
      MarketCategory.forex => Assets.images.tabs.forex,
      MarketCategory.crypto => Assets.images.tabs.crypto,
    };

    return image.image(width: size, height: size, fit: BoxFit.contain);
  }
}

class MarketSegmentedControl extends StatelessWidget {
  final MarketSegment selectedSegment;
  final ValueChanged<MarketSegment> onSelected;

  const MarketSegmentedControl({
    super.key,
    required this.selectedSegment,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : AppUiConstants.segmentedBarHeight +
                  AppUiConstants.smallSpacing * 2;
        final verticalPadding = (maxHeight * 0.12).clamp(
          4.0,
          AppUiConstants.smallSpacing,
        );
        final availableHeight = maxHeight - verticalPadding * 2;
        final barHeight = availableHeight <= 0
            ? 0.0
            : availableHeight.clamp(0.0, AppUiConstants.segmentedBarHeight);

        return Container(
          color: AppUiConstants.segmentedBackground,
          padding: EdgeInsets.symmetric(
            horizontal: AppUiConstants.screenPadding,
            vertical: verticalPadding,
          ),
          child: SizedBox(
            height: barHeight,
            child: Row(
              children: MarketSegment.values
                  .map(
                    (segment) => Expanded(
                      child: _SegmentItem(
                        segment: segment,
                        isActive: segment == selectedSegment,
                        onTap: () => onSelected(segment),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _SegmentItem extends StatelessWidget {
  final MarketSegment segment;
  final bool isActive;
  final VoidCallback onTap;

  const _SegmentItem({
    required this.segment,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.smallSpacing / 2,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          AppUiConstants.segmentedBorderRadius,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: isActive
              ? AppUiConstants.segmentedActiveDecoration
              : AppUiConstants.segmentedContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                segment.uppercaseLabel,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: isActive
                    ? AppUiConstants.segmentedActiveLabel
                    : AppUiConstants.segmentedInactiveLabel,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
