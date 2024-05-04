import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: ESizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// -- Cart Item
          const ECartItem(),

          if (showAddRemoveButton) const SizedBox(height: ESizes.spaceBtwItems),

          /// -- Add remove button in row with total price
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra space
                    SizedBox(width: 70),

                    /// Add and Remove Button
                    EProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// -- Product Total Price
                EProductPriceText(price: '256')
              ],
            ),
        ],
      ),
    );
  }
}
