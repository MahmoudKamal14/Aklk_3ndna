import 'package:aklk_3ndna/core/utils/app_colors.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 24),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hintText);
          }
          return null;
        },
        cursorColor: kPrimaryColor,
        keyboardType: _textInputType(hintText),
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
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

String _errorMessage(String hintText) {
  switch (hintText) {
    case 'Frist Name':
      return 'Frist Name is empty !';
    case 'Last Name':
      return 'Last Name is empty !';
    case 'Phone Number':
      return 'Phone Number is empty !';
    case 'Password':
      return 'Password is empty !';
    default:
      return 'the value is empty !';
  }
}

TextInputType _textInputType(hintText) {
  switch (hintText) {
    case 'Frist Name':
    case 'Last Name':
      return TextInputType.name;
    case 'Phone Number':
      return TextInputType.phone;
    case 'Password':
      return TextInputType.visiblePassword;
    default:
      return TextInputType.none;
  }
}
