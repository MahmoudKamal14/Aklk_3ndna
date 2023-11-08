import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        '${S.of(context).welcome}!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
