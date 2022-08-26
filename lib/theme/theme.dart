import 'package:ecommerce1/helpers/constants.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xff00C569),
      onPrimary: Color(0xFF),
      secondary: Color(0xFFcdcdcd),
      onSecondary: Color(0xFF),
      surface: Colors.transparent,
      onSurface: Color(0xFF),
      background: Colors.transparent,
      onBackground: Color(0xFF),
      error: Color(0xFFea0000),
      onError: Color(0xFF),
      brightness: Brightness.light,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))),
  );
}
