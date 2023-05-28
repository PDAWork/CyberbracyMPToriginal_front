import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
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
