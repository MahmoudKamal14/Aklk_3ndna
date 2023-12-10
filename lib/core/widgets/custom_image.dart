import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 255,
      child: Image.asset(url),
    );
  }
}
