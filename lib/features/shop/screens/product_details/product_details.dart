import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const EBottomAddToCart(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            /// -- Product Image Slider
            const EProductImageSlider(),

            /// -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                left: ESizes.defaultSpace,
                right: ESizes.defaultSpace,
                bottom: ESizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating and share
                  const ERatingAndShare(),

                  /// Price, Title, Stock & Brand
                  const EProductMetaData(),

                  /// Attributes
                  const EProductAttributes(),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// Description
                  const ESectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  const ReadMoreText(
                    'Hello My name is Hafizur Rahman. I currently studying at DIU in Computer Science and Engineering. Learning new technology is my hobby and i am currently learning everything. I made some great application with dart and flutter',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Review
                  const Divider(),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ESectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(
                          () => const ProductReviewsScreen(),
                        ),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
