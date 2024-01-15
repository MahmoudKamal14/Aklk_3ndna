import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/generated/l10n.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
    this.hintTextStyle,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final TextStyle? hintTextStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 14),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hintText, context);
          }
          return null;
        },
        controller: controller,
        cursorColor: kPrimaryColor,
        keyboardType: _textInputType(hintText, context),
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          border: _getBorderStyle(),
          focusedBorder: _getBorderStyle(),
          enabledBorder: _getBorderStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

OutlineInputBorder _getBorderStyle({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? kPrimaryColor,
    ),
  );
}

String _errorMessage(String hintText, context) {
  if (hintText == '${S.of(context).name}')
    return '${S.of(context).name} ${S.of(context).isEmpty}';
  else if (hintText == '${S.of(context).email}')
    return '${S.of(context).email} ${S.of(context).isEmpty}';
  else if (hintText == '${S.of(context).phoneNumber}')
    return '${S.of(context).phoneNumber} ${S.of(context).isEmpty}';
  else
    return '${S.of(context).password} ${S.of(context).isEmpty}';
}

TextInputType _textInputType(hintText, context) {
  if (hintText == '${S.of(context).name}')
    return TextInputType.name;
  else if (hintText == '${S.of(context).email}')
    return TextInputType.emailAddress;
  else if (hintText == '${S.of(context).phoneNumber}')
    return TextInputType.phone;
  else if (hintText == '${S.of(context).password}')
    return TextInputType.visiblePassword;
  else
    return TextInputType.none;
}
