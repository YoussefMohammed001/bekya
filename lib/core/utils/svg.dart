import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSVG extends StatelessWidget {
  const AppSVG({
    Key? key,
    required this.assetName,
    this.width,
    this.height,
    this.color,
    this.boxFit = BoxFit.contain,
  }) : super(key: key);

  final String assetName;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    String assetPath = assetName;
    if (!assetPath.contains('images')) {
      assetPath = "assets/images/$assetPath.svg";
    }

    return SvgPicture.asset(

      assetPath,
      fit: boxFit,
      height: height,
      width: width,
      // ignore: deprecated_member_use
      color: color,
      matchTextDirection: true,
    );
  }
}
