import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../gen/assets.gen.dart';
import '../../../ui/theme/app_ui_constants.dart';
import 'gradient_box_border.dart';

/// Wallet widget displaying balance with tap navigation
class WalletWidget extends StatelessWidget {
  final String balance;
  final VoidCallback? onTap;
  final bool isLandscape;

  const WalletWidget({
    super.key,
    required this.balance,
    this.onTap,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    final balanceFontSize = isLandscape ? 14.0 : 16.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppUiConstants.buttonBorderRadius),
        border: GradientBoxBorder(
          gradient: AppUiConstants.brandGradient,
          width: 1.15,
        ),
        boxShadow: [
          BoxShadow(
            color: AppUiConstants.brandShadow,
            offset: const Offset(0, 2.3),
          ),
        ],
        color: AppUiConstants.whiteText
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppUiConstants.buttonBorderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppUiConstants.smallSpacing,
            vertical: AppUiConstants.smallSpacing,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => AppUiConstants.brandGradient.createShader(bounds),
                blendMode: BlendMode.srcATop,
                child: SvgPicture.asset(
                  Assets.images.navbar.wallet,
                ),
              ),
              const SizedBox(width: 6),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: AppUiConstants.secondaryTextStyle.copyWith(
                      fontSize: 12.0,
                      color: AppUiConstants.headerContentColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  ShaderMask(
                    shaderCallback: (bounds) => AppUiConstants.secondaryGradient.createShader(bounds),
                    child: Text(
                      balance,
                      style: AppUiConstants.mediumHeading.copyWith(
                        fontSize: balanceFontSize,
                        color: AppUiConstants.headerContentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
