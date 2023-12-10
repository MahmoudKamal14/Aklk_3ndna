import 'package:flutter/material.dart';

class CustomTextNoInternet extends StatelessWidget {
  const CustomTextNoInternet({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
