import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_up_view.dart';
import 'package:aklk_3ndna/features/on_borading/data/models/on_borading_model.dart';
import 'package:aklk_3ndna/features/on_borading/presentation/widgets/custom_nav_bar.dart';
import 'package:aklk_3ndna/features/on_borading/presentation/widgets/on_borading_body_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class ONBoradingView extends StatefulWidget {
  const ONBoradingView({super.key});
  static const String id = "onBorading";

  @override
  State<ONBoradingView> createState() => _ONBoradingViewState();
}

class _ONBoradingViewState extends State<ONBoradingView> {
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
                  Navigator.pushNamed(context, SignUpView.id);
                },
              ),
              // Image.asset(
              //   isArabic()
              //       ? Assets.imagesAklk3ndnaAr1
              //       : Assets.imagesAklk3ndnaEn1,
              //   height: 70,
              //   color: const Color(0xffEEA734),
              // ),
              ONBoradingBody(
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
                        Navigator.pushReplacementNamed(context, SignUpView.id);
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
