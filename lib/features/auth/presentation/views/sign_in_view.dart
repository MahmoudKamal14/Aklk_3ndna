import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const id = 'signIn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
        centerTitle: true,
      ),
    );
  }
}
