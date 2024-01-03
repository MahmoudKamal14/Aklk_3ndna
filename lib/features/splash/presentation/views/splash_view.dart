import 'package:aklk_3ndna/core/database/cache/cache_helper.dart';
import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/home/presentation/view/bottom_nav_bar.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/views/get_started_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatelessWidget {
  static String id = '/';
  const SplashView({super.key});
  Widget _nextScreen() {
    bool isGetStartedVisisted = getIt<CacheHelper>().getData(
          key: GetStartedView.id,
        ) ??
        false;
    if (isGetStartedVisisted == true) {
      if (FirebaseAuth.instance.currentUser == null) {
        return const SignInView();
      } else if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
        return const BottomNavBar();
      } else {
        return const SignInView();
      }
    } else {
      return const GetStartedView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xfffffcec),
      splash: Image.asset(
        isArabic()
            ? Assets.imagesSplashAklk3ndnaAr
            : Assets.imagesSplashAklk3ndnaAr,
      ),
      splashIconSize: 500,
      pageTransitionType: PageTransitionType.bottomToTop,
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: _nextScreen(),
    );
  }
}
