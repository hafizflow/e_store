import 'package:e_store/features/shop/screens/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  EHomeAppBar(),

                  /// Searchbar

                  /// Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
