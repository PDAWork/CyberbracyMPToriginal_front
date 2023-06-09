import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  indicatorColor: ColorTheme.darkRed,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontFamily: 'PTSerif', fontSize: 32),
    headlineMedium: TextStyle(fontFamily: 'PTSerif', fontSize: 26),
    bodyLarge: TextStyle(fontFamily: 'Inter', fontSize: 16),
    bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: 14),
    bodySmall: TextStyle(fontFamily: 'Inter', fontSize: 12),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: ColorTheme.darkRed),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const MaterialStatePropertyAll(Size(50, 50)),
      side: MaterialStatePropertyAll(
        BorderSide(
          color: ColorTheme.red,
          width: 2.0,
        ),
      ),
      overlayColor: MaterialStatePropertyAll(ColorTheme.lightRed),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      foregroundColor: MaterialStatePropertyAll(ColorTheme.red),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const MaterialStatePropertyAll(Size(50, 50)),
      backgroundColor: MaterialStatePropertyAll(ColorTheme.red),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  ),
);
