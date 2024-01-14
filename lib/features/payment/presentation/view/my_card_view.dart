import 'package:aklk_3ndna/core/widgets/payment_custom_bar.dart';
import 'package:aklk_3ndna/features/payment/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: buildAppBar(title: 'My Cart', context: context),
      body: const MyCartViewBody(),
    );
  }
}
