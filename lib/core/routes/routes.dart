// ignore_for_file: equal_keys_in_map

import 'package:aklk_3ndna/features/auth/presentation/views/forgot_password_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_up_view.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/views/get_started_view.dart';
import 'package:aklk_3ndna/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:aklk_3ndna/features/splash/presentation/views/splash_view.dart';

var routes = {
  SplashView.id: (context) => const SplashView(),
  GetStartedView.id: (context) => const GetStartedView(),
  OnBoardingView.id: (context) => const OnBoardingView(),
  SignUpView.id: (context) => const SignUpView(),
  SignInView.id: (context) => const SignInView(),
  ForgotPasswordView.id: (context) => const ForgotPasswordView(),
};
