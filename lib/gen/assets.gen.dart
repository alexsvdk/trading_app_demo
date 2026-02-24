// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/navbar
  $AssetsImagesNavbarGen get navbar => const $AssetsImagesNavbarGen();

  /// Directory path: assets/images/tabs
  $AssetsImagesTabsGen get tabs => const $AssetsImagesTabsGen();
}

class $AssetsImagesNavbarGen {
  const $AssetsImagesNavbarGen();

  /// File path: assets/images/navbar/favirites.svg
  String get favirites => 'assets/images/navbar/favirites.svg';

  /// File path: assets/images/navbar/order.svg
  String get order => 'assets/images/navbar/order.svg';

  /// File path: assets/images/navbar/positions.svg
  String get positions => 'assets/images/navbar/positions.svg';

  /// File path: assets/images/navbar/wallet.svg
  String get wallet => 'assets/images/navbar/wallet.svg';

  /// List of all assets
  List<String> get values => [favirites, order, positions, wallet];
}

class $AssetsImagesTabsGen {
  const $AssetsImagesTabsGen();

  /// File path: assets/images/tabs/International.png
  AssetGenImage get international =>
      const AssetGenImage('assets/images/tabs/International.png');

  /// File path: assets/images/tabs/crypto.png
  AssetGenImage get crypto =>
      const AssetGenImage('assets/images/tabs/crypto.png');

  /// File path: assets/images/tabs/forex.png
  AssetGenImage get forex =>
      const AssetGenImage('assets/images/tabs/forex.png');

  /// File path: assets/images/tabs/indian_market.png
  AssetGenImage get indianMarket =>
      const AssetGenImage('assets/images/tabs/indian_market.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    international,
    crypto,
    forex,
    indianMarket,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
