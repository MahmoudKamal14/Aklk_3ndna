import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
        dotWidth: 10,
        dotHeight: 5,
        activeDotColor: kPrimaryColor,
      ),
    );
  }
}
