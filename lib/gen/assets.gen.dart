/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/images/png/ic_launcher.png');

  /// List of all assets
  List<AssetGenImage> get values => [icLauncher];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/contact_us_nav_icon.svg
  SvgGenImage get contactUsNavIcon =>
      const SvgGenImage('assets/images/svg/contact_us_nav_icon.svg');

  /// File path: assets/images/svg/home_nav_icon.svg
  SvgGenImage get homeNavIcon =>
      const SvgGenImage('assets/images/svg/home_nav_icon.svg');

  /// File path: assets/images/svg/ic_error.svg
  SvgGenImage get icError =>
      const SvgGenImage('assets/images/svg/ic_error.svg');

  /// File path: assets/images/svg/ic_next.svg
  SvgGenImage get icNext => const SvgGenImage('assets/images/svg/ic_next.svg');

  /// File path: assets/images/svg/map_nav_icon.svg
  SvgGenImage get mapNavIcon =>
      const SvgGenImage('assets/images/svg/map_nav_icon.svg');

  /// File path: assets/images/svg/more_nav_icon.svg
  SvgGenImage get moreNavIcon =>
      const SvgGenImage('assets/images/svg/more_nav_icon.svg');

  /// File path: assets/images/svg/nodata.svg
  SvgGenImage get nodata => const SvgGenImage('assets/images/svg/nodata.svg');

  /// File path: assets/images/svg/placehold.svg
  SvgGenImage get placehold =>
      const SvgGenImage('assets/images/svg/placehold.svg');

  /// File path: assets/images/svg/settings_nav_icon.svg
  SvgGenImage get settingsNavIcon =>
      const SvgGenImage('assets/images/svg/settings_nav_icon.svg');

  /// File path: assets/images/svg/toast_error_icon.svg
  SvgGenImage get toastErrorIcon =>
      const SvgGenImage('assets/images/svg/toast_error_icon.svg');

  /// File path: assets/images/svg/toast_success_icon.svg
  SvgGenImage get toastSuccessIcon =>
      const SvgGenImage('assets/images/svg/toast_success_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        contactUsNavIcon,
        homeNavIcon,
        icError,
        icNext,
        mapNavIcon,
        moreNavIcon,
        nodata,
        placehold,
        settingsNavIcon,
        toastErrorIcon,
        toastSuccessIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}