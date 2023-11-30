import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key, required this.text1, required this.text2,this.onTap});
  final String text1, text2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: InkWell(
        onTap: onTap,
        child: Text.rich(
          TextSpan(children: [
            TextSpan(text: text1),
            TextSpan(
              text: text2,
              style: TextStyle(color: kPrimaryColor),
            ),
          ]),
        ),
      ),
    );
  }
}
