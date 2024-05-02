import 'package:e_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:e_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_bar_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const EAppBar(
        title: Text('Reviews and Rating'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating and reviews are verified and are from people who use the same type of device that you use.',
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Overall product rating
              const EOverallProductRating(),
              const ERatingBarIndicator(rating: 4.8),
              Text('12345', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// User review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
