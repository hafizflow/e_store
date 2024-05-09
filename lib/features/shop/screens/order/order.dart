import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/features/shop/screens/order/widgets/order_list_item.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EAppBar(showBackArrow: true, title: Text('My Orders')),
      body: Padding(
        padding: EdgeInsets.all(ESizes.defaultSpace),
        child: EOrderListItems(),
      ),
    );
  }
}
