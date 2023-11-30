import 'package:aklk_3ndna/core/functions/is_arabic.dart';
import 'package:aklk_3ndna/core/utils/app_controller.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/cubit/auth_state.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/custon_text_form_filed.dart';
import 'package:aklk_3ndna/features/auth/presentation/widget/terms_and_condition_widget.dart';
import 'package:aklk_3ndna/features/home/presentation/view/home.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState)
          Navigator.pushReplacementNamed(context, HomeView.id);
      },
      builder: (context, state) => Form(
        key: _globalKey,
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
            TermsAndConditionWidget(),
            SizedBox(height: height * 0.08),
            Builder(
              builder: (context) {
                if (state is! CreateUserLoadingState)
                  return CustomButton(
                    text: S.of(context).signUp,
                    onPressed: () {
                      {
                        if (_globalKey.currentState!.validate()) {
                          AuthCubit.get(context).userRegister(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                          );
                        }
                      }
                    },
                  );
                else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

String getFlag() {
  String countryCode = 'eg';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  return flag;
}
