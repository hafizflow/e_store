import 'package:e_store/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.animation,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.image,
  });

  final String title, subtitle;
  final VoidCallback? onPressed;
  final String? image;
  final String? animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              image != null
                  ?

                  /// Image
                  Image.asset(image!)
                  :

                  /// Animation
                  Lottie.asset(
                      animation!, // Show lottie animation
                      width: MediaQuery.of(context).size.width * .6,
                    ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(ETexts.eContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
