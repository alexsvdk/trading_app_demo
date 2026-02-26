import 'package:flutter/material.dart';
import '../../../ui/theme/app_ui_constants.dart';

/// Notification widget with badge counter
class NotificationWidget extends StatelessWidget {
  final int count;
  final VoidCallback? onTap;
  final bool isLandscape;

  const NotificationWidget({
    super.key,
    required this.count,
    this.onTap,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = isLandscape ? 20.0 : 24.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppUiConstants.buttonBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppUiConstants.smallSpacing),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.notifications,
                color: AppUiConstants.headerContentColor,
                size: iconSize,
              ),
              if (count > 0)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: AppUiConstants.notificationBadgeDecoration,
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      count > 99 ? '99+' : count.toString(),
                      style: AppUiConstants.tinyText.copyWith(
                        color: AppUiConstants.whiteText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
