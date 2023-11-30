import 'package:aklk_3ndna/core/services/service_locator.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_up_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_sign_in_form.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/have_an_account_widget.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const id = 'signIn';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: height * 0.16),
                WelcomeTextWidget(),
                SizedBox(height: height * 0.08),
                CustomSignInForm(),
                SizedBox(height: height * 0.02),
                HaveAnAccountWidget(
                  text1: S.of(context).DoYouHaveAnAccount,
                  text2: S.of(context).signUp,
                  onTap: () {
                    Navigator.pushNamed(context, SignUpView.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

