import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(
                Size(50, 50),
              ),
              side: const MaterialStatePropertyAll(
                BorderSide(
                  color: Color(0xFFE04142),
                  width: 2.0,
                ),
              ),
              overlayColor: const MaterialStatePropertyAll(Color(0xFFFFDBDB)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              foregroundColor:
                  const MaterialStatePropertyAll(Color(0xFFE04142)),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(
                Size(50, 50),
              ),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFFE04142)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        );