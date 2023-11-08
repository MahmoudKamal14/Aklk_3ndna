import 'package:aklk_3ndna/features/auth/presentation/widget/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConidtionWidget extends StatelessWidget {
  const TermsAndConidtionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: 'I have agree to our ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: 'Terms and Condition',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.grey,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
