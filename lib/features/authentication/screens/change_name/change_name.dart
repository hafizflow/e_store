import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/features/authentication/controllers/change_name/change_name_controller.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());

    return Scaffold(
      /// Custom Appbar
      appBar: EAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            Text(
              'Use real name for verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: ESizes.spaceBtwInputFields),

            /// Text Fields and buttons
            Form(
              key: controller.changeNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        EValidator.validateEmptyText(ETexts.firstName, value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: ETexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        EValidator.validateEmptyText(ETexts.lastName, value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: ETexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            /// Saved Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.changeUserName(),
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
