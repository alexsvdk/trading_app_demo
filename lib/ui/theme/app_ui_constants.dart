import 'package:flutter/material.dart';

class AppUiConstants {
  AppUiConstants._();

  // ==================== COLORS ====================

  // Brand Gradient Colors
  static const Color brandGradientStart = Color(0xFF436EDD); // Blue
  static const Color brandGradientMiddle = Color(0xFFAF7CE3); // Light Purple
  static const Color brandGradientEnd = Color(0xFFAF69C7); // Purple
  static const Color brandShadow = Color(0xFFC28FEA); // Light Purple Shadow

  // Secondary Gradient Colors
  static const Color secondaryGradientStart = Color(0xFF6768E1); // Purple
  static const Color secondaryGradientEnd = Color(0xFF4A419C); // Dark Purple

  // Navbar Gradient Colors
  static const Color navbarGradientStart = Color(0xFF6768E1); // Purple
  static const Color navbarGradientEnd = Color(0xFF4A419C); // Dark Purple

  // Active Tab Color
  static const Color activeTabColor = Color(0xFF436EDD); // Solid Blue

  // Functional Colors
  static const Color successGreen = Color(0xFF34A853); // Positive price changes
  static const Color warningRed = Color(0xFFFF5405); // Negative price changes
  static const Color buyButtonColor = Color(0xFF34A853); // Light green
  static const Color sellButtonColor = Color(0xFFFF5405); // Red
  static const Color chartIconColor = Color(0xFF436EDD); // Blue

  // Notification Colors
  static const Color notificationBadgeStart = Color(0xFFA71212); // Dark Red
  static const Color notificationBadgeEnd = Color(0xFFFF0000); // Red

  // Text Colors
  static const Color primaryText = Color(0xFF333333); // Dark gray
  static const Color secondaryText = Color(0xFF666666); // Medium gray
  static const Color tertiaryText = Color(0xFF888888); // Light gray
  static const Color whiteText = Color(0xFFFFFFFF); // White
  // Header content color (used on light header backgrounds)
  static const Color headerContentColor = primaryText;

  // Background Colors
  static const Color primaryBackground = Color(0xFFFFFFFF); // White
  static const Color secondaryBackground = Color(0xFFF5F5F5); // Light gray
  static const Color tertiaryBackground = Color(0xFFFAFAFA); // Very light gray

  // Border Colors
  static const Color lightBorder = Color(0xFFE0E0E0); // Light gray
  static const Color mediumBorder = Color(0xFFCCCCCC); // Medium gray

  // Inactive Colors
  static const Color inactiveColor = Color(0xFF9E9E9E); // Gray
  static const Color tabBarDivider = Color(0xFFE6E6E6); // Light divider
  static const Color segmentedBackground = Color(0xFFF8F7FB); // Light lavender
  static const Color segmentedInactiveText = Color(0xFF777777); // Medium gray
  static const Color segmentedActiveText = Color(0xFFFFFFFF); // White
  static const Color activeTabUnderline = Color(0xFF222222); // Near-black

  // ==================== SIZES ====================

  // Screen Dimensions
  static const double screenWidth = 390.0;
  static const double contentWidth = 350.0;

  // Portrait Dimensions
  static const double headerHeight = 90.0;
  static const double tabBarHeight = 80.0;
  static const double tabBarTopPadding = 10.0;
  static const double tabBarBottomPadding = 6.0;
  static const double tabBarItemWidth = 80.0;
  static const double tabBarIconSize = 50.0;
  static const double tabBarUnderlineHeight = 4.0;
  static const double tabBarUnderlineWidth = 56.0;
  static const double segmentedBarHeight = 56.0;
  static const double tabBarLabelFontSize = 10.0;
  static const double tabBarActiveIconScale = 1.4;
  static const Duration tabBarIconAnimDuration = Duration(milliseconds: 220);
  static const Curve tabBarIconAnimCurve = Curves.easeOutCubic;
  static const double searchBarHeight = 40.0;
  static const double listItemHeight = 80.0;
  static const double bottomNavHeight = 70.0;

  // Landscape Dimensions
  static const double landscapeHeaderHeight = 60.0;
  static const double landscapeTabBarHeight = 45.0;
  static const double landscapeSearchBarHeight = 36.0;
  static const double landscapeListItemHeight = 90.0;
  static const double landscapeBottomNavHeight = 55.0;
  static const double landscapeSidebarWidth = 120.0;

  // Navbar Cutout Dimensions
  static const double navbarCutoutRadius = 35.0;
  static const double navbarCutoutWidth = 140.0;
  static const double navbarCutoutDepth = 18.0;
  static const double navbarCutoutMultiplier = 1.0;

  // Navbar Shadow (Figma design)
  static const double navbarShadowLeftBlur = 28.0;
  static const double navbarShadowLeftOffset = -3.0;
  static const double navbarShadowLeftOpacity = 0.25;

  static const double navbarShadowRightBlur = 4.0;
  static const double navbarShadowRightOffset = 7.0;
  static const double navbarShadowRightOpacity = 0.25;

  // Grid Layout
  // Calculated based on actual card content:
  // - Padding: 24px (12px * 2)
  // - Contract info: ~180px (name + date + icon + spacing)
  // - Price info: ~320px (price + percentage + 2 buttons + spacing)
  // - Minimum width: max(180px, 320px) + 24px = ~344px
  static const double gridMinCardWidth = 300.0;
  static const double gridMaxCardWidth = 380.0;
  static const double gridCardAspectRatio = 2.2;
  static const double gridCrossAxisSpacing = 12.0;
  static const double gridMainAxisSpacing = 12.0;

  // Button Dimensions
  static const double buttonHeight = 40.0;
  static const double buttonWidth = 80.0;

  // Icon Sizes
  static const double tabIconSize = 24.0;
  static const double navbarIconSize = 24.0;
  static const double chartIconSize = 24.0;
  static const double fabIconSize = 24.0;

  // ==================== FAB (Floating Action Button) ====================

  // FAB Dimensions
  static const double fabSize = 56.0; // Total diameter including padding
  static const double fabPadding = 8.0;
  static const double fabGap = 8.0;
  static const double fabBorderRadius = 500.0; // Circle
  static const double fabRotation = 45.0; // Degrees

  // FAB Shadow
  static const double fabShadowBlur = 8.0;
  static const double fabShadowOffset = 2.0;
  static const double fabShadowOpacity = 0.2;

  // ==================== SPACING ====================

  // Horizontal Spacing
  static const double screenPadding = 20.0;
  static const double elementSpacing = 12.0;
  static const double buttonSpacing = 10.0;

  // Vertical Spacing
  static const double sectionSpacing = 20.0;
  static const double listItemSpacing = 15.0;
  static const double smallSpacing = 8.0;
  static const double mediumSpacing = 12.0;
  static const double largeSpacing = 20.0;

  // ==================== BORDER RADIUS ====================

  static const double buttonBorderRadius = 8.0;
  static const double searchBarBorderRadius = 10.0;
  static const double tabBorderRadius = 20.0;
  static const double segmentedBorderRadius = 12.0;
  static const double cardBorderRadius = 12.0;
  static const double notificationBadgeRadius = 10.0;

  // ==================== TYPOGRAPHY ====================

  // Font Sizes
  static const double largeHeadingFontSize = 24.0;
  static const double mediumHeadingFontSize = 18.0;
  static const double bodyFontSize = 16.0;
  static const double secondaryFontSize = 14.0;
  static const double smallFontSize = 12.0;
  static const double tinyFontSize = 10.0;

  // ==================== TOUCH TARGETS ====================

  static const double minTouchTargetSize = 44.0;
  static const double recommendedTouchTargetSize = 48.0;

  // ==================== GRADIENTS ====================

  static LinearGradient get brandGradient => const LinearGradient(
    colors: [brandGradientStart, brandGradientMiddle, brandGradientEnd],
  );

  static LinearGradient get secondaryGradient => const LinearGradient(
    colors: [secondaryGradientStart, secondaryGradientEnd],
  );

  static LinearGradient get navbarGradient => const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [navbarGradientEnd, navbarGradientStart],
  );

  static LinearGradient get notificationBadgeGradient => const LinearGradient(
    colors: [notificationBadgeStart, notificationBadgeEnd],
  );

  static LinearGradient get fabGradient => const LinearGradient(
    begin: Alignment(-0.91, 0.0),
    end: Alignment(0.91, 0.0),
    colors: [brandGradientStart, brandGradientMiddle, brandGradientEnd],
    stops: [0.0991, 0.5329, 0.9156],
  );

  // ==================== TEXT STYLES ====================

  static TextStyle get largeHeading => TextStyle(
    fontSize: largeHeadingFontSize,
    fontWeight: FontWeight.bold,
    color: primaryText,
  );

  static TextStyle get mediumHeading => TextStyle(
    fontSize: mediumHeadingFontSize,
    fontWeight: FontWeight.bold,
    color: primaryText,
  );

  static TextStyle get bodyText => TextStyle(
    fontSize: bodyFontSize,
    fontWeight: FontWeight.normal,
    color: primaryText,
  );

  static TextStyle get secondaryTextStyle => TextStyle(
    fontSize: secondaryFontSize,
    fontWeight: FontWeight.normal,
    color: AppUiConstants.secondaryText,
  );

  static TextStyle get tabBarActiveLabel => TextStyle(
    fontSize: tabBarLabelFontSize,
    fontWeight: FontWeight.w700,
    color: primaryText,
    letterSpacing: 0.1,
  );

  static TextStyle get tabBarInactiveLabel => TextStyle(
    fontSize: tabBarLabelFontSize,
    fontWeight: FontWeight.w500,
    color: secondaryText,
    letterSpacing: 0.1,
  );

  static TextStyle get segmentedActiveLabel => TextStyle(
    fontSize: secondaryFontSize,
    fontWeight: FontWeight.w700,
    color: segmentedActiveText,
    letterSpacing: 0.4,
  );

  static TextStyle get segmentedInactiveLabel => TextStyle(
    fontSize: secondaryFontSize,
    fontWeight: FontWeight.w600,
    color: segmentedInactiveText,
    letterSpacing: 0.4,
  );

  static TextStyle get smallText => TextStyle(
    fontSize: smallFontSize,
    fontWeight: FontWeight.normal,
    color: AppUiConstants.secondaryText,
  );

  static TextStyle get tinyText => TextStyle(
    fontSize: tinyFontSize,
    fontWeight: FontWeight.normal,
    color: AppUiConstants.secondaryText,
  );

  static TextStyle get buttonText => TextStyle(
    fontSize: secondaryFontSize,
    fontWeight: FontWeight.bold,
    color: whiteText,
  );

  static TextStyle get priceText => TextStyle(
    fontSize: bodyFontSize,
    fontWeight: FontWeight.bold,
    color: primaryText,
  );

  static TextStyle get percentageChangePositive => TextStyle(
    fontSize: secondaryFontSize,
    fontWeight: FontWeight.normal,
    color: successGreen,
  );

  static TextStyle get percentageChangeNegative => TextStyle(
    fontSize: secondaryFontSize,
    fontWeight: FontWeight.normal,
    color: warningRed,
  );

  // ==================== BOX DECORATIONS ====================

  // Lightened header gradient: 60% white + 40% brand colors
  static LinearGradient get headerLightGradient => LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.lerp(Colors.white, brandGradientStart, 0.4)!,
      Color.lerp(Colors.white, brandGradientMiddle, 0.4)!,
      Color.lerp(Colors.white, brandGradientEnd, 0.4)!,
    ],
  );

  static BoxDecoration get headerDecoration =>
      BoxDecoration(gradient: headerLightGradient);

  static BoxDecoration get activeTabDecoration => BoxDecoration(
    color: activeTabColor,
    borderRadius: BorderRadius.circular(tabBorderRadius),
  );

  static BoxDecoration get segmentedActiveDecoration => BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xFF4D7BFF), Color(0xFFB06BEA)],
    ),
    borderRadius: BorderRadius.circular(segmentedBorderRadius),
  );

  static BoxDecoration get segmentedContainerDecoration => BoxDecoration(
    color: segmentedBackground,
    borderRadius: BorderRadius.circular(segmentedBorderRadius),
  );

  static BoxDecoration get buyButtonDecoration => BoxDecoration(
    color: buyButtonColor,
    borderRadius: BorderRadius.circular(buttonBorderRadius),
    boxShadow: [
      BoxShadow(
        color: buyButtonColor.withValues(alpha: 0.3),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration get sellButtonDecoration => BoxDecoration(
    color: sellButtonColor,
    borderRadius: BorderRadius.circular(buttonBorderRadius),
    boxShadow: [
      BoxShadow(
        color: sellButtonColor.withValues(alpha: 0.3),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration get searchBarDecoration => BoxDecoration(
    color: secondaryBackground,
    borderRadius: BorderRadius.circular(searchBarBorderRadius),
  );

  static BoxDecoration get listItemDecoration => BoxDecoration(
    color: primaryBackground,
    border: Border(bottom: BorderSide(color: lightBorder, width: 1)),
  );

  static BoxDecoration get notificationBadgeDecoration => BoxDecoration(
    gradient: notificationBadgeGradient,
    shape: BoxShape.circle,
  );

  static BoxDecoration get fabDecoration => BoxDecoration(
    gradient: fabGradient,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: fabShadowOpacity),
        blurRadius: fabShadowBlur,
        offset: Offset(0, fabShadowOffset),
      ),
    ],
  );

  // ==================== ORIENTATION HELPERS ====================

  /// Get header height based on orientation
  static double getHeaderHeight(bool isLandscape) {
    return isLandscape ? landscapeHeaderHeight : headerHeight;
  }

  /// Get tab bar height based on orientation
  static double getTabBarHeight(bool isLandscape) {
    return isLandscape ? landscapeTabBarHeight : tabBarHeight;
  }

  /// Get search bar height based on orientation
  static double getSearchBarHeight(bool isLandscape) {
    return isLandscape ? landscapeSearchBarHeight : searchBarHeight;
  }

  /// Get list item height based on orientation
  static double getListItemHeight(bool isLandscape) {
    return isLandscape ? landscapeListItemHeight : listItemHeight;
  }

  /// Get bottom nav height based on orientation
  static double getBottomNavHeight(bool isLandscape) {
    return isLandscape ? landscapeBottomNavHeight : bottomNavHeight;
  }

  /// Calculate number of grid columns based on available width
  /// Returns optimal number of columns (1-4) based on card width constraints
  static int calculateGridColumns(double availableWidth) {
    // Calculate max columns based on minimum card width
    final maxColumns =
        (availableWidth / (gridMinCardWidth + 2 * gridCrossAxisSpacing))
            .floor();

    // Calculate min columns based on maximum card width
    final minColumns =
        (availableWidth / (gridMaxCardWidth + 2 * gridCrossAxisSpacing)).round();

    // Use the larger of the two to ensure optimal card sizing
    // If minColumns > maxColumns, it means we can fit fewer columns with max card width
    final optimalColumns = maxColumns > minColumns ? maxColumns : minColumns;

    // Ensure at least 1 column and at most 4 columns
    return optimalColumns.clamp(1, 4);
  }

  /// Calculate optimal card width for grid
  static double calculateCardWidth(double availableWidth, int columns) {
    final totalSpacing = (columns - 1) * gridCrossAxisSpacing;
    final padding = screenPadding * 2;
    return (availableWidth - totalSpacing - padding) / columns;
  }
}
