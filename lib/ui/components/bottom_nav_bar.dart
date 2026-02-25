import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_ui_constants.dart';
import '../utils/bottom_nav_bar_clipper.dart';

/// Navigation item model
class NavItem {
  final String label;
  final String iconPath;
  final bool isCenter;

  const NavItem({
    required this.label,
    required this.iconPath,
    this.isCenter = false,
  });
}

/// Custom bottom navigation bar with circular cutout for center item
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isLandscape;
  final List<NavItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.isLandscape,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final height = AppUiConstants.getBottomNavHeight(isLandscape);
    final cutoutDepth =
        AppUiConstants.navbarCutoutDepth *
        AppUiConstants.navbarCutoutMultiplier;

    return Container(
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          // Left shadow from Figma
          BoxShadow(
            color: Colors.black.withValues(
              alpha: AppUiConstants.navbarShadowLeftOpacity,
            ),
            blurRadius: AppUiConstants.navbarShadowLeftBlur,
            offset: Offset(AppUiConstants.navbarShadowLeftOffset, 0),
          ),

          // Right shadow from Figma
        ],
      ),
      child: Stack(
        children: [
          // Navbar with clipper (without center item)
          ClipPath(
            clipper: BottomNavBarClipper(
              cutoutRadius: AppUiConstants.navbarCutoutRadius,
              cutoutWidth: AppUiConstants.navbarCutoutWidth,
              cutoutDepth: AppUiConstants.navbarCutoutDepth,
              multiplier: AppUiConstants.navbarCutoutMultiplier,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppUiConstants.navbarGradient,
              ),
              child: SafeArea(
                top: false,
                child: _buildNavItems(context, height, cutoutDepth),
              ),
            ),
          ),
          // Center item on top (not clipped)
          _buildCenterItemOverlay(context, height, cutoutDepth),
        ],
      ),
    );
  }

  Widget _buildNavItems(
    BuildContext context,
    double height,
    double cutoutDepth,
  ) {
    return Row(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isActive = index == currentIndex;
        final isCenterItem = item.isCenter;

        Widget button = Container(
          padding: const EdgeInsets.only(bottom: 8),
          height: height,
          alignment: Alignment.bottomCenter,
          child: _buildRegularItem(context, item, isActive, isCenterItem),
        );

        if (!isCenterItem) {
          button = Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onTap(index),
              splashColor: Colors.white.withValues(alpha: 0.2),
              highlightColor: Colors.white.withValues(alpha: 0.1),
              child: button,
            ),
          );
        }

        return Expanded(child: button);
      }).toList(),
    );
  }

  Widget _buildCenterItemOverlay(
    BuildContext context,
    double height,
    double cutoutDepth,
  ) {
    final centerIndex = items.indexWhere((item) => item.isCenter);
    if (centerIndex == -1) return const SizedBox.shrink();

    final centerItem = items[centerIndex];

    return Positioned(
      top: 0,
      bottom: 12,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: Offset(0, -cutoutDepth * 0.5),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onTap(centerIndex),
              splashColor: Colors.white.withValues(alpha: 0.3),
              highlightColor: Colors.white.withValues(alpha: 0.15),
              customBorder: const CircleBorder(),
              child: _buildCenterItem(centerItem),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegularItem(
    BuildContext context,
    NavItem item,
    bool isActive,
    bool isCentralItem,
  ) {
    final iconSize = isLandscape ? 20.0 : AppUiConstants.navbarIconSize;
    final fontSize = isLandscape ? 9.0 : 10.0;
    final spacing = isLandscape ? 2.0 : 4.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isCentralItem)
          SvgPicture.asset(
            item.iconPath,
            width: iconSize,
            height: iconSize,
            colorFilter: ColorFilter.mode(
              isActive ? Colors.white : Colors.white.withValues(alpha: 0.5),
              BlendMode.srcIn,
            ),
          ),
        if (!isCentralItem) SizedBox(height: spacing),
        Text(
          item.label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive
                ? Colors.white
                : Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildCenterItem(NavItem item) {
    return Transform.rotate(
      angle: AppUiConstants.fabRotation * 3.14159 / 180,
      child: Ink(
        width: AppUiConstants.fabSize,
        height: AppUiConstants.fabSize,
        decoration: AppUiConstants.fabDecoration,
        child: Center(),
      ),
    );
  }
}
