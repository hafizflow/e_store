import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ECircularContainer extends StatelessWidget {
  const ECircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.borderRadius = 400,
    this.padding = 0,
    this.margin,
    this.backgroundColor = EColors.white,
  });

  final double? width;
  final double? height;
  final double padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
