import 'package:e_store/common/styles/shadows.dart';
import 'package:e_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_store/common/widgets/icons/e_circular_icon.dart';
import 'package:e_store/common/widgets/images/e_rounded_image.dart';
import 'package:e_store/common/widgets/texts/brand_title_text_with_verfied_icon.dart';
import 'package:e_store/common/widgets/texts/product_price_text.dart';
import 'package:e_store/common/widgets/texts/product_title_text.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class EHorizontalCard extends StatelessWidget {
  const EHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [EShadows.verticalProductShadows],
        borderRadius: BorderRadius.circular(ESizes.productImageRadius),
        color: EHelperFunctions.isDarkMode(context)
            ? EColors.darkerGrey
            : EColors.grey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          ERoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ESizes.sm),
            backgroundColor: dark ? EColors.dark : EColors.light,
            child: Stack(
              children: [
                /// Thumbnail image
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: ERoundedImage(
                    imageUrl: EImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// Sale tag
                Positioned(
                  top: 12,
                  child: ERoundedContainer(
                    backgroundColor: EColors.secondary.withOpacity(.8),
                    radius: ESizes.sm,
                    padding: const EdgeInsets.symmetric(
                      horizontal: ESizes.sm,
                      vertical: ESizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),

                /// Favourite icon button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: ECircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ESizes.sm, left: ESizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EProductTitleText(
                        title: 'Green Nike Shoes Half Sleeves shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: ESizes.spaceBtwItems / 2),
                      EBrandTitleTextWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: EProductPriceText(price: '256.0')),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: EColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ESizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(ESizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: ESizes.iconLg * 1.2,
                          height: ESizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: EColors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
