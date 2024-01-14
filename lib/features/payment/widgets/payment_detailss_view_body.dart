import 'dart:developer';
import 'package:aklk_3ndna/core/widgets/payment_custom_button.dart';
import 'package:aklk_3ndna/features/payment/presentation/view/thank_you_view.dart';
import 'package:aklk_3ndna/features/payment/widgets/custom_credit_card.dart';
import 'package:aklk_3ndna/features/payment/widgets/payment_methods_list_view.dart';

import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: PaymentMethodsListView(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              autovalidateMode: autovalidateMode,
              formKey: formKey,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                  child: PCustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        log('payment');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const ThankYouView();
                            },
                          ),
                        );
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      } else {}
                    },
                    text: 'Payment',
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
