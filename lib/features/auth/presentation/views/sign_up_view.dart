import 'package:aklk_3ndna/features/auth/cubit_auth/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_sign_up_form.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/have_an_account_widget.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const id = 'signUp';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: height * 0.15),
                WelcomeTextWidget(text: S.of(context).welcome),
                SizedBox(height: height * 0.06),
                CustomSignUpForm(),
                SizedBox(height: height * 0.02),
                HaveAnAccountWidget(
                  text1: S.of(context).AlreadyHaveAnAccount,
                  text2: S.of(context).signIn,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, SignInView.id);
                  },
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
