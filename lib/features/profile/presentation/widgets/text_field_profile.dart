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
        border: const OutlineInputBorder(),
        hintText: hintText,
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
