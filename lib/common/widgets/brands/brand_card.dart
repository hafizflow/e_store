import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/e_circular_image.dart';
import '../texts/brand_title_text_with_verfied_icon.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: ERoundedContainer(
        padding: const EdgeInsets.all(ESizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: ECircularImage(
                image: EImages.clothIcon,
                overlayColor: EHelperFunctions.isDarkMode(context)
                    ? EColors.white
                    : EColors.dark,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: ESizes.spaceBtwItems / 2),

            /// -- Text
            // [Expanded] & Column [MinAxisSize.min] is important to keep the element
            // in the vertical and also to keep text inside the boundaries
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EBrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '256 products left',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
