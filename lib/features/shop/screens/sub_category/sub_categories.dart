import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/e_rounded_image.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ///  Banner
              const ERoundedImage(
                imageUrl: EImages.promoBanner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              ///   Sub-category
              Column(
                children: [
                  /// Heading
                  ESectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
