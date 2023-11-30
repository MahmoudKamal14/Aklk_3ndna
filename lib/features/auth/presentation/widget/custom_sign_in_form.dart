import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_state.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custon_text_form_filed.dart';
import 'package:aklk_3ndna/features/home/presentation/view/home.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatefulWidget {
  CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginInUserSuccessState) {
          Navigator.pushReplacementNamed(context, HomeView.id);
        }
      },
      builder: (context, state) => Form(
        key: _globalKey,
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
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  AuthCubit.get(context).obscurePasswordText();
                },
              ),
              obscureText: AuthCubit.get(context).obscurePasswordTextValue,
            ),
            SizedBox(height: height * 0.3),
            Builder(builder: (context) {
              if (state is! LoginInUserLoadingState)
                return CustomButton(
                    text: S.of(context).signIn,
                    onPressed: () {
                      {
                        if (_globalKey.currentState!.validate()) {
                          AuthCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      }
                    });
              else {
                return Center(child: CircularProgressIndicator());
              }
            }),
          ],
        ),
      ),
    );
  }
}
