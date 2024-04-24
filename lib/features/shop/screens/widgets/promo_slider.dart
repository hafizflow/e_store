import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/images/e_rounded_image.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/home_controller.dart';

class EPromoSlider extends StatelessWidget {
  const EPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => ERoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  ECircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? EColors.primary
                        : EColors.grey,
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
