import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/assets.dart';

class SvgImage extends StatelessWidget {
  const SvgImage(
    this.imageAsset, {
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    super.key,
  });

  final SvgAssets imageAsset;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageAsset.filename,
      height: height,
      width: width,
      fit: fit,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
