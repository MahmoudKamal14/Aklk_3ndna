import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:aklk_3ndna/features/auth/presentation/auth_cubit/auth_state.dart';
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
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) => Form(
        key: _globalKey,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Frist Name',
            ),
            CustomTextFormField(
              hintText: 'Last Name',
            ),
            CustomTextFormField(
              hintText: 'Phone Number',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  getflag() + ' +20 ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            CustomTextFormField(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  BlocProvider.of<AuthCubit>(context)
                              .obscurePasswordTextValue ==
                          true
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).obscurePasswordText();
                },
              ),
              obscureText:
                  BlocProvider.of<AuthCubit>(context).obscurePasswordTextValue,
            ),
            TermsAndConidtionWidget(),
            SizedBox(height: height * 0.11),
            CustomButton(
                text: S.of(context).signUp,
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {}
                }),
          ],
        ),
      ),
    );
  }
}

String getflag() {
  String countryCode = 'eg';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  return flag;
}
