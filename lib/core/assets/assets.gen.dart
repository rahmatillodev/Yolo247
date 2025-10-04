// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/KaushanScript-Regular.ttf
  String get kaushanScriptRegular => 'assets/fonts/KaushanScript-Regular.ttf';

  /// List of all assets
  List<String> get values => [kaushanScriptRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icons/Icon.png');

  /// File path: assets/icons/arrow_back.png
  AssetGenImage get arrowBack =>
      const AssetGenImage('assets/icons/arrow_back.png');

  /// File path: assets/icons/edit.png
  AssetGenImage get edit => const AssetGenImage('assets/icons/edit.png');

  /// File path: assets/icons/home_icon.svg
  String get homeIcon => 'assets/icons/home_icon.svg';

  /// File path: assets/icons/match_history.svg
  String get matchHistory => 'assets/icons/match_history.svg';

  /// File path: assets/icons/match_status.svg
  String get matchStatus => 'assets/icons/match_status.svg';

  /// File path: assets/icons/menu_icon.png
  AssetGenImage get menuIcon =>
      const AssetGenImage('assets/icons/menu_icon.png');

  /// File path: assets/icons/new_match_icon.svg
  String get newMatchIcon => 'assets/icons/new_match_icon.svg';

  /// File path: assets/icons/player_status.svg
  String get playerStatus => 'assets/icons/player_status.svg';

  /// File path: assets/icons/team.svg
  String get team => 'assets/icons/team.svg';

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<dynamic> get values => [
    icon,
    arrowBack,
    edit,
    homeIcon,
    matchHistory,
    matchStatus,
    menuIcon,
    newMatchIcon,
    playerStatus,
    team,
    user,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/banner_background.png
  AssetGenImage get bannerBackground =>
      const AssetGenImage('assets/images/banner_background.png');

  /// File path: assets/images/history.png
  AssetGenImage get history => const AssetGenImage('assets/images/history.png');

  /// File path: assets/images/history_icon.png
  AssetGenImage get historyIcon =>
      const AssetGenImage('assets/images/history_icon.png');

  /// File path: assets/images/india_flag.png
  AssetGenImage get indiaFlag =>
      const AssetGenImage('assets/images/india_flag.png');

  /// File path: assets/images/match_background.png
  AssetGenImage get matchBackground =>
      const AssetGenImage('assets/images/match_background.png');

  /// File path: assets/images/new_match.png
  AssetGenImage get newMatch =>
      const AssetGenImage('assets/images/new_match.png');

  /// File path: assets/images/statistics.png
  AssetGenImage get statistics =>
      const AssetGenImage('assets/images/statistics.png');

  /// File path: assets/images/team.png
  AssetGenImage get team => const AssetGenImage('assets/images/team.png');

  /// File path: assets/images/team_2.png
  AssetGenImage get team2 => const AssetGenImage('assets/images/team_2.png');

  /// File path: assets/images/team_flag.png
  AssetGenImage get teamFlag =>
      const AssetGenImage('assets/images/team_flag.png');

  /// File path: assets/images/welcome_background.png
  AssetGenImage get welcomeBackground =>
      const AssetGenImage('assets/images/welcome_background.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    banner,
    bannerBackground,
    history,
    historyIcon,
    indiaFlag,
    matchBackground,
    newMatch,
    statistics,
    team,
    team2,
    teamFlag,
    welcomeBackground,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
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
