import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
      ),
    );
  }
}
