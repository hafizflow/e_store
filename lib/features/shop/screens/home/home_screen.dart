import 'package:e_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const EPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  EHomeAppBar(),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// Searchbar
                  ESearchContainer(text: 'Search in Store'),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: ESizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        ESectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: EColors.white,
                        ),
                        SizedBox(height: ESizes.spaceBtwItems),

                        /// Categories
                        EHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: ESizes.spaceBtwSections)
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo slider
                  const EPromoSlider(
                    banners: [
                      EImages.promoBanner1,
                      EImages.promoBanner2,
                      EImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// Heading
                  ESectionHeading(title: 'Popular Products', onPressed: () {}),
                  const SizedBox(height: ESizes.spaceBtwItems),

                  /// Popular products
                  EGridLayout(
                    itemBuilder: (_, index) => const EProductCardVertical(),
                    itemCount: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
