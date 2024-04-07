import 'package:e_store/common/styles/spacing_styles.dart';
import 'package:e_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              const ELoginHeader(),

              /// Login Form
              const ELoginForm(),

              /// Divider
              EFormDivider(dividerText: ETexts.orSignInWith.capitalize!),

              const SizedBox(height: ESizes.spaceBtwSections),

              /// Footer
              const ESocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
