import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class EBillingAddressSection extends StatelessWidget {
  const EBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(
          title: 'Shipping Address',
          onPressed: () {},
          buttonTitle: 'Change',
        ),
        Text(
          'Hafizur Rahman',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, size: 16, color: Colors.grey),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text(
              '+880 1736692183',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, size: 16, color: Colors.grey),
            const SizedBox(width: ESizes.spaceBtwItems),
            Text(
              'Dendabor 1344 Pollibidut, Savar, Dhaka, BD',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
