import 'package:flutter/material.dart';

AppBar buildAppBar({final String? title, required BuildContext context}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Theme.of(context).appBarTheme.titleTextStyle,
    ),
  );
}
