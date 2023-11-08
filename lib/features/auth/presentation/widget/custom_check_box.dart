import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: kPrimaryColor,
        side: BorderSide(
          color: Colors.grey,
        ),
        value: value,
        onChanged: (newValue) {
          setState(() {
            value = newValue!;
          });
        });
  }
}
