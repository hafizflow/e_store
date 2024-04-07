import 'package:e_store/features/authentication/screens/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_store/features/authentication/screens/onBoarding/widgets/onboarding_next_button.dart';
import 'package:e_store/features/authentication/screens/onBoarding/widgets/onboarding_page.dart';
import 'package:e_store/features/authentication/screens/onBoarding/widgets/onboarding_skip.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: EImages.onBoarding1,
                title: EText.onBoardingTitle1,
                subTitle: EText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: EImages.onBoarding2,
                title: EText.onBoardingTitle2,
                subTitle: EText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: EImages.onBoarding3,
                title: EText.onBoardingTitle3,
                subTitle: EText.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
