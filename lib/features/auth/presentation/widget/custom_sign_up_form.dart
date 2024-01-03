import 'package:aklk_3ndna/core/functions/get_flag.dart';
import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/core/functions/show_toast.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_state.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custom_circular_indicator.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custon_text_form_filed.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/terms_and_condition_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showToast(
              msg: "Successfully,Check your email to verfiy your account",
              color: kPrimaryColor);
          Navigator.pushReplacementNamed(context, SignInView.id);
        } else if (state is SignupFailureState) {
          showToast(msg: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) => Form(
        key: _signupFormKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: S.of(context).name,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: S.of(context).email,
            ),
            CustomTextFormField(
              controller: phoneController,
              hintText: S.of(context).phoneNumber,
              suffixIcon: isArabic()
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        getFlag() + ' +20 ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )
                  : null,
              prefixIcon: isArabic()
                  ? null
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        getFlag() + ' +20 ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: S.of(context).password,
              suffixIcon: IconButton(
                icon: Icon(
                  AuthCubit.get(context).obscurePasswordTextValue == true
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  AuthCubit.get(context).obscurePasswordText();
                },
              ),
              obscureText: AuthCubit.get(context).obscurePasswordTextValue,
            ),
            const TermsAndConditionWidget(),
            SizedBox(height: height * 0.08),
            Builder(
              builder: (context) {
                if (state is! SignupLoadingState)
                  return CustomButton(
                    color:
                        AuthCubit.get(context).termsAndConditionCheckBoxValue ==
                                false
                            ? Colors.grey
                            : null,
                    text: S.of(context).signUp,
                    onPressed: () async {
                      {
                        if (AuthCubit.get(context)
                                .termsAndConditionCheckBoxValue ==
                            true) {
                          if (_signupFormKey.currentState!.validate()) {
                            await AuthCubit.get(context)
                                .signUpWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                              userName: nameController.text,
                              phone: phoneController.text,
                            );
                          }
                        }
                      }
                    },
                  );
                else {
                  return const CustomCircularIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
