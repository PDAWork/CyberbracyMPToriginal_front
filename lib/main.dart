import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/controller/pin_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/view/pin_verification.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/controller/sign_in_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/view/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/controller/sign_up_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/view/sign_up.dart';
import 'package:cyberbracy_mpt_original_front/presentation/chat_bot/presentation/chat_bot.dart';
import 'package:cyberbracy_mpt_original_front/presentation/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/presentation/control_supervisory_body.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/state/control_supervisory_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/presentation/home.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/state/control_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/presentation/requirements.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/state/requirements_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/requirement_body.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/widget/show_message_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/const/theme_data.dart';
import 'core/scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(
          create: (context) => sl(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => sl<SignInCubit>(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => sl<SignUpCubit>(),
        ),
        BlocProvider<PinCubit>(
          create: (context) => sl<PinCubit>(),
        )
      ],
      child: MaterialApp(
        scrollBehavior: ScrollWithoutSplash(),
        scaffoldMessengerKey: SnackBarService.scaffoldKey,
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
            'requirement_body' => MaterialPageRoute(
                builder: (_) => RequirementBody(),
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
        initialRoute: 'home',
      ),
    );
  }
}
