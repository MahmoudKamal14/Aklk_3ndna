import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_up_view.dart';
import 'package:aklk_3ndna/features/on_borading/presentation/views/get_started_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatelessWidget {
  static String id = 'splashView';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xffFFFBED),
      splash: Image.asset(
        isArabic()
            ? Assets.imagesSplashAklk3ndnaAr
            : Assets.imagesSplashAklk3ndnaEn,
      ),
      splashIconSize: 500,
      pageTransitionType: PageTransitionType.bottomToTop,
      splashTransition: SplashTransition.scaleTransition,
      nextScreen:
          (getIt<CacheHelper>().getData(key: GetStartedView.id) ?? false)
              ? const SignUpView()
              : const GetStartedView(),
    );
  }
}
