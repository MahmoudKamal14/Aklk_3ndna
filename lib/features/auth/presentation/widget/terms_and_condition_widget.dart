import 'package:aklk_3ndna/features/auth/presentation/widget/custom_check_box.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: S.of(context).TermsAndConditions,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
