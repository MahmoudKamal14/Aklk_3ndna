import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_up_view.dart';
import 'package:aklk_3ndna/features/on_borading/presentation/views/get_started_view.dart';
import 'package:aklk_3ndna/features/on_borading/presentation/views/on_borading_view.dart';
import 'package:aklk_3ndna/features/splash/presentation/views/splash_view.dart';

var routes = {
  SplashView.id: (context) => const SplashView(),
  GetStartedView.id: (context) => const GetStartedView(),
  ONBoradingView.id: (context) => const ONBoradingView(),
  SignUpView.id: (context) => const SignUpView(),
  SignInView.id: (context) => const SignInView()
};
