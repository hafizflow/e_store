import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curverd_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ECurvedEdgeWidget(
      child: Container(
        color: EColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: ECircularContainer(
                  backgroundColor: EColors.textWhite.withOpacity(.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: ECircularContainer(
                  backgroundColor: EColors.textWhite.withOpacity(.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
