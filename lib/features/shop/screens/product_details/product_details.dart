import 'package:e_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image Slider
            EProductImageSlider(),

            /// -- Product Details
            Padding(
              padding: EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating and share
                  ERatingAndShare(),

                  /// Price, Title, Stock & Brand
                  EProductMetaData(),

                  /// Attributes
                  /// Checkout button
                  /// Description
                  /// Review
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
