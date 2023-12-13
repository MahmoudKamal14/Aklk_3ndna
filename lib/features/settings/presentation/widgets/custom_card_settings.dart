import 'package:flutter/material.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({
    super.key,
    required this.leading,
    required this.trailing,
    required this.text,
    required this.onPressed,
  });
  final IconData leading;
  final IconData trailing;
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: ListTile(
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(trailing),
          color: Colors.blueGrey,
        ),
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
