import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget textFieldProfile({
  required TextEditingController controller,
  required TextInputType type,
  String? label,
  String? hintText,
  IconData? prefix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 22,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: _getBorderStyle(),
        focusedBorder: _getBorderStyle(),
        enabledBorder: _getBorderStyle(color: Colors.grey),
        hintText: hintText,
        prefixIconColor: Colors.amber,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 22,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(prefix),
      ),
    );
OutlineInputBorder _getBorderStyle({Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color ?? kPrimaryColor,
    ),
  );
}
