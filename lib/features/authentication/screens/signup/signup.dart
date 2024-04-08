import 'package:e_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                ETexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: ESizes.spaceBtwSections),

              /// Signup Form
              const ESignupForm(),

              const SizedBox(height: ESizes.spaceBtwSections),

              /// Divider
              EFormDivider(dividerText: ETexts.orSignUpWith.capitalize!),

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
