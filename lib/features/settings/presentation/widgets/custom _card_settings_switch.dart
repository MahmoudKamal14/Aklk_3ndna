import 'package:flutter/material.dart';

class CardSettingsSwitch extends StatelessWidget {
  const CardSettingsSwitch({
    super.key,
    required this.leading,
    required this.trailing,
    required this.text,
  });
  final IconData leading;
  final Widget trailing;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: ListTile(
        trailing: trailing,
        leading: Icon(
          leading,
          size: 30,
          color: Colors.amber,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
