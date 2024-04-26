import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/icons/e_circular_icon.dart';
import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_store/features/shop/screens/home/home_screen.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          ECircularIcon(
            icon: Iconsax.add,
            backgroundColor: EHelperFunctions.isDarkMode(context)
                ? EColors.dark
                : EColors.light,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              EGridLayout(
                itemCount: 8,
                itemBuilder: (_, index) => const EProductCardVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
