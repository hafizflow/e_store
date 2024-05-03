import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/e_rounded_image.dart';
import '../../texts/brand_title_text_with_verfied_icon.dart';
import '../../texts/product_title_text.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Image
        ERoundedImage(
          imageUrl: EImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ESizes.sm),
          backgroundColor: dark ? EColors.darkerGrey : EColors.light,
        ),
        const SizedBox(width: ESizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const EProductTitleText(
                title: 'Black Sports Shoes',
                maxLines: 1,
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 38',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
