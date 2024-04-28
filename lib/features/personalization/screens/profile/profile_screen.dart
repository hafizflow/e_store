import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/e_circular_image.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const ECircularImage(
                      image: EImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
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
                value: 'Hafizur Rahman',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Username',
                value: 'Hafizur Rahman',
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
                value: '56789',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              EProfileMenu(
                title: 'Email',
                value: 'rahman45@gmail.com',
                onPressed: () {},
              ),
              EProfileMenu(
                title: 'Phone No',
                value: '0123456789',
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
                  onPressed: () {},
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
