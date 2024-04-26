import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = ESizes.sm,
    this.isNetworkImage = false,
    required this.image,
    this.fit = BoxFit.cover,
  });

  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : (EHelperFunctions.isDarkMode(context)
                ? EColors.black
                : EColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
