import 'package:e_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        ESectionHeading(
          title: 'Payment Method',
          onPressed: () {},
          buttonTitle: 'Change',
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            ERoundedContainer(
              height: 35,
              width: 60,
              backgroundColor: dark ? EColors.light : EColors.white,
              padding: const EdgeInsets.all(ESizes.sm),
              child: const Image(
                image: AssetImage(EImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwItems / 2),
            Text(
              'Paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
