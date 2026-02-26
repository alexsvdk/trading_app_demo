import 'package:flutter/material.dart';
import 'menu_button.dart';
import 'wallet_widget.dart';
import 'notification_widget.dart';
import '../../theme/app_ui_constants.dart';

/// App header component with menu, title, wallet balance, and notifications
class AppHeader extends StatelessWidget {
  final String balance;
  final int notificationCount;
  final bool isLandscape;
  final VoidCallback? onMenuTap;
  final VoidCallback? onWalletTap;
  final VoidCallback? onNotificationTap;

  const AppHeader({
    super.key,
    required this.balance,
    required this.notificationCount,
    required this.isLandscape,
    this.onMenuTap,
    this.onWalletTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    final headerHeight = AppUiConstants.getHeaderHeight(isLandscape);
    final verticalPadding = isLandscape ? 4.0 : AppUiConstants.smallSpacing;
    final titleFontSize = isLandscape ? 14.0 : 20.0;

    return Container(
      height: headerHeight,
      decoration: AppUiConstants.headerDecoration,
      padding: EdgeInsets.symmetric(
        horizontal: AppUiConstants.screenPadding,
        vertical: verticalPadding,
      ),
      child: Row(
        children: [
          // Menu Button
          MenuButton(
            onTap: onMenuTap,
            isLandscape: isLandscape,
          ),
          SizedBox(width: isLandscape ? 8.0 : AppUiConstants.elementSpacing),
          // Title
          Expanded(
            child: Text(
              'Market Watch',
              style: AppUiConstants.mediumHeading.copyWith(
                color: AppUiConstants.headerContentColor,
                fontSize: titleFontSize,
              ),
            ),
          ),
          SizedBox(width: isLandscape ? 8.0 : AppUiConstants.elementSpacing),
          // Balance Widget
          WalletWidget(
            balance: balance,
            onTap: onWalletTap,
            isLandscape: isLandscape,
          ),
          SizedBox(width: isLandscape ? 8.0 : AppUiConstants.elementSpacing),
          // Notification Widget
          NotificationWidget(
            count: notificationCount,
            onTap: onNotificationTap,
            isLandscape: isLandscape,
          ),
        ],
      ),
    );
  }
}
