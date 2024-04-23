import 'package:flutter/material.dart';

import '../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../utils/constants/image_strings.dart';

class EHomeCategories extends StatelessWidget {
  const EHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return const EVerticalImageText(
            image: EImages.shoeIcon,
            title: 'Shores for all',
          );
        },
      ),
    );
  }
}
