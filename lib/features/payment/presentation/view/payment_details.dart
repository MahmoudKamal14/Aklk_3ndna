import 'package:aklk_3ndna/core/widgets/payment_custom_bar.dart';
import 'package:aklk_3ndna/features/payment/widgets/payment_detailss_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: buildAppBar(title: 'Payment Details', context: context),
        body: const PaymentDetailsViewBody(),
      ),
    );
  }
}
