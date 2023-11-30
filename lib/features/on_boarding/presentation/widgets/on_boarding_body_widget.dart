import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  OnBoardingBody({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });
  final Function(int) onPageChanged;
  final PageController controller;
  final List<OnBoardingModel> onBoardingData =
      isArabic() ? boardingListArabic : boardingListEnglish;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: boardingListEnglish.length,
        controller: controller,
        onPageChanged: onPageChanged,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(onBoardingData[index].pathImage,
                  width: 300, height: 300),
              const SizedBox(height: 24),
              Text(
                onBoardingData[index].title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                onBoardingData[index].subTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomSmoothPageIndicator(controller: controller),
            ],
          );
        }),
      ),
    );
  }
}
