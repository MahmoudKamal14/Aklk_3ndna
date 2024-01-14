import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    color: HexColor('333739'),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      height: 1.3,
    ),
  ),
  cardColor: Colors.grey[900],
  canvasColor: Color.fromARGB(255, 119, 93, 83),
  dividerColor: Colors.grey,
  secondaryHeaderColor: Color.fromARGB(255, 55, 55, 49),
);
