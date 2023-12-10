import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Text(
        S.of(context).supTitleForgetPassword,
        textAlign: TextAlign.center,
      ),
    );
  }
}
