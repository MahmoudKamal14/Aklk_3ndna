import 'package:aklk_3ndna/core/functions/show_toast.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_state.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_circular_indicator.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custon_text_form_filed.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/forgot_password_text_widget.dart';
import 'package:aklk_3ndna/features/home/presentation/view/bottom_nav_bar.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatefulWidget {
  CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  final GlobalKey<FormState> _signinFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                  return BottomNavBar();
                }))
              : showToast(
                  msg: "Please Verify Your Account", color: kPrimaryColor);
        } else if (state is SigninFailureState) {
          showToast(msg: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) => Form(
        key: _signinFormKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: emailController,
              hintText: S.of(context).email,
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: S.of(context).password,
              suffixIcon: IconButton(
                icon: Icon(
                  AuthCubit.get(context).obscurePasswordTextValue == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  AuthCubit.get(context).obscurePasswordText();
                },
              ),
              obscureText: AuthCubit.get(context).obscurePasswordTextValue,
            ),
            SizedBox(height: height * 0.01),
            const ForgotPasswordTextWidget(),
            SizedBox(height: height * 0.269),
            Builder(builder: (context) {
              if (state is! SigninLoadingState)
                return CustomButton(
                    text: S.of(context).signIn,
                    onPressed: () async {
                      {
                        if (_signinFormKey.currentState!.validate()) {
                          await AuthCubit.get(context)
                              .sigInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      }
                    });
              else {
                return const CustomCircularIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}
