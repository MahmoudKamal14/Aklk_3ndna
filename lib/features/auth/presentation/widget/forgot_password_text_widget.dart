import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/forgot_password_view.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, ForgotPasswordView.id);
      },
      child: Align(
        alignment: isArabic() ? Alignment.centerLeft : Alignment.centerRight,
        child: Text(
          S.of(context).forgotPassword,
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
