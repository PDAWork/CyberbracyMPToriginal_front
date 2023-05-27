import 'package:cyberbracy_mpt_original_front/const/theme_data.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/state/control_supervisory_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/presentation/home.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/state/control_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/pin_verification/presentation/pin_verification.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/presentation/requirements.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/state/requirements_cubit.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/presentation/sign_in/presentation/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/presentation/sign_up.dart/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/chat_bot/presentation/chat_bot.dart';
import 'presentation/control_supervisory_body/presentation/control_supervisory_body.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
          "control_supervisory_body" => MaterialPageRoute(builder: (_) {
              String lowName =
                  (settings.arguments as Map<String, String>)['lowName']!;
              return BlocProvider(
                create: (context) => sl<ControlSupervisoryBodyCubit>(),
                child: ControlSupervisoryBody(
                  lowName: lowName,
                ),
              );
            }),
          "chat_bot" => MaterialPageRoute(
              builder: (_) => const ChatBot(),
            ),
          "requirements" => MaterialPageRoute(
              builder: (_) {
                final String lowName =
                    (settings.arguments as Map<String, dynamic>)['lowName'];
                final int idControl =
                    (settings.arguments as Map<String, dynamic>)['idControl'];
                return BlocProvider(
                  create: (context) =>
                      sl<RequirementsCubit>()..init(lowName, idControl),
                  child: const Requirements(),
                );
              },
            ),
          "home" => MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => sl<ControlBodyCubit>()..init(),
                child: const Home(),
              ),
            ),
          _ => MaterialPageRoute(builder: (_) => const Placeholder())
        };
      },
      initialRoute: 'sign_in',
    );
  }
}
