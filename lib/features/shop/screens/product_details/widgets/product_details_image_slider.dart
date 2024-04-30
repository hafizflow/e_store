import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curverd_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/e_circular_icon.dart';
import '../../../../../common/widgets/images/e_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return ECurvedEdgeWidget(
      child: Container(
        color: dark ? EColors.darkerGrey : EColors.light,
        child: Stack(
          children: [
            /// -- Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(ESizes.defaultSpace * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(EImages.productImage1),
                  ),
                ),
              ),
            ),

            /// -- Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: ESizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return ERoundedImage(
                      width: 80,
                      imageUrl: EImages.productImage1,
                      backgroundColor: dark ? EColors.dark : EColors.white,
                      padding: const EdgeInsets.all(ESizes.sm),
                      border: Border.all(color: EColors.primary),
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: ESizes.spaceBtwItems),
                  itemCount: 6,
                ),
              ),
            ),

            /// -- Appbar
            const EAppBar(
              showBackArrow: true,
              action: [
                ECircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
