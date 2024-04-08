import 'package:e_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              Text(
                ETexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              Text(
                ETexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: ESizes.spaceBtwSections * 2),

              /// Email field
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(ETexts.email),
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.off(() => const ResetPassword()),
                    child: const Text(ETexts.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
