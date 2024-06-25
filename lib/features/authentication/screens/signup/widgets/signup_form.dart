import 'package:e_store/features/authentication/screens/signup/widgets/terms_and_condition_checkbox.dart';
import 'package:e_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signup/signup_controller.dart';

class ESignupForm extends StatelessWidget {
  const ESignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      EValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text(ETexts.firstName),
                  ),
                ),
              ),
              const SizedBox(width: ESizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      EValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text(ETexts.lastName),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                EValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              label: Text(ETexts.username),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => EValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              label: Text(ETexts.email),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => EValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              label: Text(ETexts.phoneNo),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwInputFields),

          /// Password
          Obx(() => TextFormField(
                controller: controller.password,
                validator: (value) => EValidator.validatePassword(value),
                // expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                  label: const Text(ETexts.password),
                ),
              )),
          const SizedBox(height: ESizes.spaceBtwInputFields / 2),

          /// Terms & Condition Checkbox
          const ETermsAndConditionCheckbox(),
          const SizedBox(height: ESizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(ETexts.createAccount),
              onPressed: () => controller.signup(),
            ),
          ),
        ],
      ),
    );
  }
}
