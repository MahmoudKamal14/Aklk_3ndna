import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/widgets/custom_nav_bar.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/widgets/on_boarding_body_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const String id = "onBoarding";

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 20),
              CustomNavBar(
                onTap: () {
                  Navigator.pushNamed(context, SignInView.id);
                },
              ),
              OnBoardingBody(
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  controller: _controller),
              const SizedBox(height: 50),
              currentIndex == boardingListArabic.length - 1
                  ? CustomButton(
                      text: S.of(context).next,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, SignInView.id);
                      },
                    )
                  : CustomButton(
                      text: S.of(context).next,
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(microseconds: 200),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
