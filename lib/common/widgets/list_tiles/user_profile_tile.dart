import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/e_circular_image.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ECircularImage(
        image: EImages.user,
        padding: 0,
        width: 50,
        height: 50,
      ),
      title: Text(
        'Haifzur Rahman',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: EColors.white),
      ),
      subtitle: Text(
        'rahman45@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: EColors.white),
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
