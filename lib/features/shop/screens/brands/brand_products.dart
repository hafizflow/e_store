import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/brands/brand_card.dart';
import 'package:e_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              EBrandCard(showBorder: true),
              SizedBox(height: ESizes.spaceBtwSections),

              ESortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
