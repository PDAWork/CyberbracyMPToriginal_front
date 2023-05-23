import 'package:cyberbracy_mpt_original_front/const/theme_data.dart';
import 'package:cyberbracy_mpt_original_front/home/presentation/home.dart';
import 'package:cyberbracy_mpt_original_front/pin_verification/presentation/pin_verification.dart';
import 'package:cyberbracy_mpt_original_front/sign_in/presentation/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/sign_up.dart/presentation/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: (settings) {
        return switch (settings.name!) {
          "sign_in" => MaterialPageRoute(builder: (_) => const SignIn()),
          "sign_up" => MaterialPageRoute(builder: (_) => const SignUp()),
          "pin_verification" => MaterialPageRoute(
              builder: (_) => const PinVerification(),
            ),
        "home" => MaterialPageRoute(builder: (_)=> const Home()),
          _ => MaterialPageRoute(builder: (_) => const Placeholder())
        };
      },
      initialRoute: 'sign_in',
    );
  }
}
