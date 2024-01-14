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
      color: Theme.of(context).cardColor,
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
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
