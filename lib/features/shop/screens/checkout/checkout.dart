import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_store/common/widgets/success_screen/success_screen.dart';
import 'package:e_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_store/navigation_menu.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const EAppBar(title: Text('Checkout'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// -- Item in cart
              const ECartItems(showAddRemoveButton: false),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// -- Coupon TextField
              const ECouponCode(),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// -- Billing Section
              ERoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: dark ? EColors.black : EColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    EBillingAmountSection(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    /// Payment Methods
                    EBillingPaymentSection(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    /// Address
                    EBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(
          child: const Text('Checkout \$256.0'),
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: EImages.successfulPaymentIcon,
              title: 'Payment Successfull',
              subtitle: 'Your item will be shipped soon',
              onPressed: () => Get.to(() => const NavigationMenu()),
            ),
          ),
        ),
      ),
    );
  }
}
