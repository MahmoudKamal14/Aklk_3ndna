import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_sign_up_form.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/have_an_account_widget.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const id = 'signUp';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: height * 0.15),
                WelcomeTextWidget(),
                SizedBox(height: height * 0.06),
                CustomSignUpForm(),
                SizedBox(height: height * 0.02),
                HaveAnAccountWidget(
                    text1: 'Already have an account ? ', text2: 'Sign In'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
