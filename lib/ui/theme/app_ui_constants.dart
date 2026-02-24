import 'package:flutter/material.dart';

class AppUiConstants {
  AppUiConstants._();

  // ==================== COLORS ====================

  // Brand Gradient Colors
  static const Color brandGradientStart = Color(0xFF436EDD); // Blue
  static const Color brandGradientMiddle = Color(0xFFAF7CE3); // Light Purple
  static const Color brandGradientEnd = Color(0xFFAF69C7); // Purple

  // Secondary Gradient Colors
  static const Color secondaryGradientStart = Color(0xFF6768E1); // Purple
  static const Color secondaryGradientEnd = Color(0xFF4A419C); // Dark Purple

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

  // Background Colors
  static const Color primaryBackground = Color(0xFFFFFFFF); // White
  static const Color secondaryBackground = Color(0xFFF5F5F5); // Light gray
  static const Color tertiaryBackground = Color(0xFFFAFAFA); // Very light gray

  // Border Colors
  static const Color lightBorder = Color(0xFFE0E0E0); // Light gray
  static const Color mediumBorder = Color(0xFFCCCCCC); // Medium gray

  // Inactive Colors
  static const Color inactiveColor = Color(0xFF9E9E9E); // Gray

  // ==================== SIZES ====================

  // Screen Dimensions
  static const double screenWidth = 390.0;
  static const double contentWidth = 350.0;

  // Component Heights
  static const double headerHeight = 90.0;
  static const double tabBarHeight = 50.0;
  static const double searchBarHeight = 40.0;
  static const double listItemHeight = 80.0;
  static const double bottomNavHeight = 70.0;

  // Button Dimensions
  static const double buttonHeight = 40.0;
  static const double buttonWidth = 80.0;

  // Icon Sizes
  static const double tabIconSize = 24.0;
  static const double navbarIconSize = 24.0;
  static const double chartIconSize = 24.0;

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
        colors: [
          brandGradientStart,
          brandGradientMiddle,
          brandGradientEnd,
        ],
      );

  static LinearGradient get secondaryGradient => const LinearGradient(
        colors: [
          secondaryGradientStart,
          secondaryGradientEnd,
        ],
      );

  static LinearGradient get notificationBadgeGradient => const LinearGradient(
        colors: [
          notificationBadgeStart,
          notificationBadgeEnd,
        ],
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

  static TextStyle get smallText => TextStyle(
        fontSize: smallFontSize,
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

  static BoxDecoration get headerDecoration => BoxDecoration(
        gradient: brandGradient,
      );

  static BoxDecoration get activeTabDecoration => BoxDecoration(
        color: activeTabColor,
        borderRadius: BorderRadius.circular(tabBorderRadius),
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
        border: Border(
          bottom: BorderSide(color: lightBorder, width: 1),
        ),
      );

  static BoxDecoration get notificationBadgeDecoration => BoxDecoration(
        gradient: notificationBadgeGradient,
        shape: BoxShape.circle,
      );
}