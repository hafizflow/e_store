import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/texts/product_price_text.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(
          child: const Text('Checkout \$256.0'),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (_, index) => const Column(
            children: [
              ECartItem(),
              SizedBox(height: ESizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),

                      /// Add and Remove Button
                      EProductQuantityWithAddRemoveButton(),
                    ],
                  ),
                  EProductPriceText(price: '256')
                ],
              )
            ],
          ),
          separatorBuilder: (_, __) =>
              const SizedBox(height: ESizes.spaceBtwSections),
        ),
      ),
    );
  }
}
