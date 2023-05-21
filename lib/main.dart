import 'package:cyberbracy_mpt_original_front/const/theme_data.dart';
import 'package:cyberbracy_mpt_original_front/sign_in/presentation/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: const SignIn(),
    );
  }
}
