import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/cart/cart_screen.dart';
import '../../../../utils/constants/colors.dart';

class ECartCounterIcon extends StatelessWidget {
  const ECartCounterIcon({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor != null
                ? iconColor!
                : dark
                    ? EColors.white
                    : EColors.black,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark
                  ? EColors.white.withOpacity(.6)
                  : EColors.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "10",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? EColors.black : EColors.white,
                      fontSizeFactor: .8,
                      fontWeightDelta: 2,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
