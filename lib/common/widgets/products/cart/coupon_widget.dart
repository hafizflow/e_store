import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class ECouponCode extends StatelessWidget {
  const ECouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);

    return ERoundedContainer(
      showBorder: true,
      backgroundColor: dark ? EColors.dark : EColors.white,
      padding: const EdgeInsets.only(
        top: ESizes.sm,
        bottom: ESizes.sm,
        right: ESizes.sm,
        left: ESizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? EColors.white.withOpacity(.5)
                      : EColors.dark.withOpacity(.5),
                  backgroundColor: EColors.grey.withOpacity(.6),
                  side: BorderSide(
                    color: EColors.grey.withOpacity(.1),
                  ),
                ),
                onPressed: () {},
                child: const Text('Apply')),
          )
        ],
      ),
    );
  }
}
