import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_forgot_password_form.dart';
import 'package:aklk_3ndna/core/widgets/custom_image.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/forgot_password_sub_title.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const id = 'forgotPassword';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).cardColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: height * 0.1),
                WelcomeTextWidget(text: S.of(context).forgotPassword),
                CustomImage(
                  url: Assets.imagesForgotPassword,
                ),
                SizedBox(height: height * 0.03),
                ForgotPasswordSubTitle(),
                SizedBox(height: height * 0.03),
                CustomForgotPasswrodForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
