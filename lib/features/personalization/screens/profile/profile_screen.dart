import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/e_circular_image.dart';
import 'package:e_store/common/widgets/shimmer_effect/shimmer.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_store/features/personalization/controllers/user_controller.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      /// -- Appbar
      appBar: EAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isEmpty ? EImages.user : networkImage;
                      return controller.imageUploading.value
                          ? const EShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : ECircularImage(
                              isNetworkImage:
                                  networkImage.isNotEmpty ? true : false,
                              image: image,
                              width: 80,
                              height: 80,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: ESizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Heading Profile Info
              const ESectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              EProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.off(() => const ChangeName()),
              ),
              EProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onPressed: () {},
              ),

              const SizedBox(height: ESizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// Heading Profile Info
              const ESectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              EProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              EProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Phone No',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Date Of Birth',
                value: '24 Oct 1994',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
