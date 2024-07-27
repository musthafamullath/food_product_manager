import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: "K2D",
  colorScheme: ColorScheme.light(
      surface: Colors.deepOrange.shade200,
      primary: Colors.deepOrange.shade100,
      secondary: Colors.deepOrange.shade50),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
    fontFamily: "K2D",
  colorScheme: ColorScheme.dark(
      surface: Colors.deepOrange.shade600,
      primary: Colors.deepOrange.shade50,
      secondary: Colors.deepOrange.shade400),
);

