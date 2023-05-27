import 'package:cyberbracy_mpt_original_front/chat_bot/presentation/chat_bot.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/const/theme_data.dart';
import 'package:cyberbracy_mpt_original_front/home/presentation/home.dart';
import 'package:cyberbracy_mpt_original_front/pin_verification/presentation/pin_verification.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/sign_in/presentation/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/sign_up.dart/presentation/sign_up.dart';
import 'package:cyberbracy_mpt_original_front/widget/show_message_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'control_supervisory_body/presentation/control_supervisory_body.dart';
import 'home/domain/repository_control_body.dart';
import 'home/state/control_body_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  oneSignal();
  await init();
  runApp(const MainApp());
}

void oneSignal() {
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('8ced7149-ca5f-471c-b828-23677f82feb7');
  String userId = 'kanada.smirnov@gmail.com';
  OneSignal.shared.setExternalUserId(userId);
  OneSignal.shared.promptUserForPushNotificationPermission();
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
      ],
      child: MaterialApp(
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
            "chat_bot" => MaterialPageRoute(
                builder: (_) => const ChatBot(),
              ),
            "home" => MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) =>
                      ControlBodyCubit(sl<RepositoryControlBody>())..init(),
                  child: const Home(),
                ),
              ),
            "control_supervisory_body" => MaterialPageRoute(
                builder: (_) => const ControlSupervisoryBody(),
              ),
            _ => MaterialPageRoute(builder: (_) => const Placeholder())
          };
        },
        initialRoute: 'sign_in',
      ),
    );
  }
}
