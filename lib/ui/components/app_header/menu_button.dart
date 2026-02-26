import 'package:flutter/material.dart';
import '../../../ui/theme/app_ui_constants.dart';

/// Menu button widget with ripple effect
class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLandscape;

  const MenuButton({
    super.key,
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
          child: Icon(
            Icons.menu,
            color: AppUiConstants.headerContentColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
