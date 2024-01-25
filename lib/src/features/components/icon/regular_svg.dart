import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegularSvg extends StatelessWidget {
  final String iconSvg;
  final double? height;
  final double? width;
  final Color? iconColor;

  const RegularSvg({
    Key? key,
    required this.iconSvg,
    this.height,
    this.width,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? AppColors.n01001F;
    return SvgPicture.asset(
      iconSvg,
      height: height ?? 20,
      width: width ?? 20,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
