import 'package:aklk_3ndna/core/functions/show_toast.dart';
import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/cubit_auth/auth_state.dart';
import 'package:aklk_3ndna/features/auth/presentation/views/sign_in_view.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custon_text_form_filed.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswrodForm extends StatefulWidget {
  const CustomForgotPasswrodForm({super.key});
  static bool pushSignIn = true;
  @override
  State<CustomForgotPasswrodForm> createState() =>
      _CustomForgotPasswrodFormState();
}

class _CustomForgotPasswrodFormState extends State<CustomForgotPasswrodForm> {
  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast(
              msg: "Check Your Email To Reset Your Password",
              color: kPrimaryColor);
          CustomForgotPasswrodForm.pushSignIn == true
              ? Navigator.pushReplacementNamed(context, SignInView.id)
              : Navigator.pop(context);
          CustomForgotPasswrodForm.pushSignIn = true;
        } else if (state is ResetPasswordFailureState) {
          showToast(msg: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _forgotPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: S.of(context).email,
                  controller: forgotPasswordController,
                ),
                const SizedBox(height: 129),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(color: kPrimaryColor)
                    : CustomButton(
                        onPressed: () async {
                          if (_forgotPasswordFormKey.currentState!.validate()) {
                            await authCubit.resetPasswordWithLink(
                                email: forgotPasswordController.text);
                          }
                        },
                        text: S.of(context).SendResetPasswordLink,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SignIpView {}
