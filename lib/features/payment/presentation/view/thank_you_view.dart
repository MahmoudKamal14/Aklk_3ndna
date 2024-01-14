import 'package:aklk_3ndna/core/widgets/payment_custom_bar.dart';
import 'package:aklk_3ndna/features/payment/widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: buildAppBar(context: context),
        body: Transform.translate(
            offset: const Offset(0, -16), child: const ThankYouViewBody()),
      ),
    );
  }
}
