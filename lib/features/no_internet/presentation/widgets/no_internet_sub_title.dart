import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class InternetSubTitle extends StatelessWidget {
  const InternetSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).PleaseCheckYourNetWorkConnection,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
      ),
    );
  }
}
