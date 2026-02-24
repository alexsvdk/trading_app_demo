import 'package:flutter/material.dart';
import 'app_ui_constants.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppUiConstants.brandGradientStart,
          error: AppUiConstants.warningRed,
          errorContainer: AppUiConstants.warningRed.withValues(alpha: 0.1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppUiConstants.primaryBackground,
      ).applyTradingApp();

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppUiConstants.brandGradientStart,
          error: AppUiConstants.warningRed,
          errorContainer: AppUiConstants.warningRed.withValues(alpha: 0.2),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ).applyTradingApp();
}

extension AppThemeColorSchemeX on ColorScheme {
  Color get success => AppUiConstants.successGreen;
  Color get warning => AppUiConstants.warningRed;
  Color get buy => AppUiConstants.buyButtonColor;
  Color get sell => AppUiConstants.sellButtonColor;
  Color get chart => AppUiConstants.chartIconColor;
  Color get brand => AppUiConstants.brandGradientStart;
  Color get brandMiddle => AppUiConstants.brandGradientMiddle;
  Color get brandEnd => AppUiConstants.brandGradientEnd;

  Color get inactive => AppUiConstants.inactiveColor;
  Color get primaryText => AppUiConstants.primaryText;
  Color get secondaryText => AppUiConstants.secondaryText;
}

class AppBorders {
  static final buttonBorderRadius = BorderRadius.circular(AppUiConstants.buttonBorderRadius);
  static final searchBarBorderRadius = BorderRadius.circular(AppUiConstants.searchBarBorderRadius);
  static final tabBorderRadius = BorderRadius.circular(AppUiConstants.tabBorderRadius);
  static final cardBorderRadius = BorderRadius.circular(AppUiConstants.cardBorderRadius);
  static final listTileBorderRadius = BorderRadius.circular(AppUiConstants.cardBorderRadius);
  static final notificationBadgeRadius = BorderRadius.circular(AppUiConstants.notificationBadgeRadius);
}

class AppDurations {
  static const lightning = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 300);
  static const medium = Duration(milliseconds: 500);
  static const slow = Duration(milliseconds: 700);

  static const priceUpdate = Duration(seconds: 3);
  static const animation = Duration(milliseconds: 250);
}

extension AppThemeX on ThemeData {
  ThemeData applyTradingApp() {
    final contentColor = colorScheme.onSurface;

    final newAppBarTheme = appBarTheme.copyWith(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: contentColor,
      titleTextStyle: AppUiConstants.mediumHeading,
      iconTheme: IconThemeData(color: contentColor),
    );

    final newListTileTheme = listTileTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: AppBorders.listTileBorderRadius,
      ),
      tileColor: colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.screenPadding,
        vertical: AppUiConstants.mediumSpacing,
      ),
      titleTextStyle: AppUiConstants.bodyText.copyWith(
        fontWeight: FontWeight.bold,
      ),
      subtitleTextStyle: AppUiConstants.secondaryTextStyle,
      textColor: contentColor,
    );

    final newCardTheme = cardTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: AppBorders.cardBorderRadius,
      ),
      color: colorScheme.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
    );

    final newElevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(
          Size(AppUiConstants.buttonWidth, AppUiConstants.buttonHeight),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textStyle: WidgetStatePropertyAll(AppUiConstants.buttonText),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppBorders.buttonBorderRadius),
        ),
      ),
    );

    final newOutlinedButtonTheme = OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: colorScheme.outline, width: 1),
        ),
        minimumSize: const WidgetStatePropertyAll(
          Size(AppUiConstants.buttonWidth, AppUiConstants.buttonHeight),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        foregroundColor: WidgetStateProperty.fromMap({
          WidgetState.disabled: colorScheme.onSurface.withValues(alpha: 0.38),
          WidgetState.any: colorScheme.primary,
        }),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        textStyle: WidgetStatePropertyAll(AppUiConstants.buttonText),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppBorders.buttonBorderRadius),
        ),
      ),
    );

    final newTextButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(
          Size(AppUiConstants.buttonWidth, AppUiConstants.buttonHeight),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
        textStyle: WidgetStatePropertyAll(AppUiConstants.buttonText),
      ),
    );

    final newInputDecorationTheme = inputDecorationTheme.copyWith(
      filled: true,
      fillColor: AppUiConstants.secondaryBackground,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppUiConstants.mediumSpacing,
        vertical: AppUiConstants.smallSpacing,
      ),
      border: OutlineInputBorder(
        borderRadius: AppBorders.searchBarBorderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppBorders.searchBarBorderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppBorders.searchBarBorderRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppBorders.searchBarBorderRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppBorders.searchBarBorderRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      hintStyle: AppUiConstants.smallText.copyWith(
        color: AppUiConstants.inactiveColor,
      ),
      prefixIconColor: AppUiConstants.inactiveColor,
      suffixIconColor: AppUiConstants.inactiveColor,
    );

    final newSnackBarTheme = SnackBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: AppUiConstants.bodyText.copyWith(
        color: colorScheme.onInverseSurface,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorders.cardBorderRadius,
      ),
      elevation: 4.0,
    );

    final newBottomNavigationBarTheme = bottomNavigationBarTheme.copyWith(
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: AppUiConstants.inactiveColor,
      selectedLabelStyle: AppUiConstants.smallText.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppUiConstants.smallText,
      showUnselectedLabels: true,
    );

    final newTabBarTheme = tabBarTheme.copyWith(
      indicator: BoxDecoration(
        color: AppUiConstants.activeTabColor,
        borderRadius: AppBorders.tabBorderRadius,
      ),
      labelColor: AppUiConstants.whiteText,
      unselectedLabelColor: AppUiConstants.inactiveColor,
      labelStyle: AppUiConstants.bodyText.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppUiConstants.bodyText,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    );

    final newIconTheme = iconTheme.copyWith(
      size: AppUiConstants.tabIconSize,
    );

    return copyWith(
      appBarTheme: newAppBarTheme,
      listTileTheme: newListTileTheme,
      cardTheme: newCardTheme,
      elevatedButtonTheme: newElevatedButtonTheme,
      outlinedButtonTheme: newOutlinedButtonTheme,
      textButtonTheme: newTextButtonTheme,
      inputDecorationTheme: newInputDecorationTheme,
      snackBarTheme: newSnackBarTheme,
      bottomNavigationBarTheme: newBottomNavigationBarTheme,
      tabBarTheme: newTabBarTheme,
      iconTheme: newIconTheme,
    );
  }

  // Custom button styles for trading app
  ButtonStyle get buyButtonStyle => ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(AppUiConstants.buyButtonColor),
        foregroundColor: const WidgetStatePropertyAll(AppUiConstants.whiteText),
        minimumSize: const WidgetStatePropertyAll(
          Size(AppUiConstants.buttonWidth, AppUiConstants.buttonHeight),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textStyle: WidgetStatePropertyAll(AppUiConstants.buttonText),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppBorders.buttonBorderRadius),
        ),
        elevation: const WidgetStatePropertyAll(2.0),
        shadowColor: WidgetStatePropertyAll(
          AppUiConstants.buyButtonColor.withValues(alpha: 0.3),
        ),
      );

  ButtonStyle get sellButtonStyle => ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(AppUiConstants.sellButtonColor),
        foregroundColor: const WidgetStatePropertyAll(AppUiConstants.whiteText),
        minimumSize: const WidgetStatePropertyAll(
          Size(AppUiConstants.buttonWidth, AppUiConstants.buttonHeight),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textStyle: WidgetStatePropertyAll(AppUiConstants.buttonText),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppBorders.buttonBorderRadius),
        ),
        elevation: const WidgetStatePropertyAll(2.0),
        shadowColor: WidgetStatePropertyAll(
          AppUiConstants.sellButtonColor.withValues(alpha: 0.3),
        ),
      );

  ButtonStyle get secondaryButtonStyle => ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(colorScheme.surface),
        foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface),
        side: WidgetStatePropertyAll(
          BorderSide(color: colorScheme.primary, width: 1),
        ),
        minimumSize: const WidgetStatePropertyAll(
          Size(AppUiConstants.buttonWidth, AppUiConstants.buttonHeight),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textStyle: WidgetStatePropertyAll(AppUiConstants.buttonText),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: AppBorders.buttonBorderRadius),
        ),
      );
}
