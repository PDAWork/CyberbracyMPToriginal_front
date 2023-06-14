import 'package:cyberbracy_mpt_original_front/core/snack_bar_service.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/controller/pin_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/view/pin_verification.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/controller/sign_in_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/view/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/controller/sign_up_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/view/sign_up.dart';
import 'package:cyberbracy_mpt_original_front/presentation/chat_bot/presentation/chat_bot.dart';
import 'package:cyberbracy_mpt_original_front/presentation/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/consult_calendar.dart';
import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/cubit/consult_calendar_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/presentation/control_supervisory_body.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/state/control_supervisory_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/presentation/home.dart';
import 'package:cyberbracy_mpt_original_front/presentation/home/state/control_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/one_signal_wrapper.dart/cubit/one_signal_wrapper_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/one_signal_wrapper.dart/one_signal_wrapper.dart';
import 'package:cyberbracy_mpt_original_front/presentation/profile/profile.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/presentation/requirements.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/state/requirements_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/presentation/requirement_body.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/state/requirement_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/support.dart';
import 'package:cyberbracy_mpt_original_front/presentation/video_call/controller/video_call_cubit.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/const/theme_data.dart';
import 'core/scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  initializeDateFormatting().then((_) => runApp(const MainApp()));
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
        ),
        BlocProvider(
          create: (context) => sl<ConsultCalendarCubit>(),
        ),
        BlocProvider<VideoCallCubit>(
          create: (context) => sl<VideoCallCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<OneSignalWrapperCubit>(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('ru'),
          Locale('en'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        scrollBehavior: ScrollWithoutSplash(),
        scaffoldMessengerKey: SnackBarService.scaffoldKey,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        onGenerateRoute: (settings) {
          return switch (settings.name!) {
            "sign_in" => MaterialPageRoute(builder: (_) => const SignIn()),
            "sign_up" => MaterialPageRoute(builder: (_) => const SignUp()),
            "consult_calendar" =>
              MaterialPageRoute(builder: (_) => const ConsultCalendar()),
            "pin_verification" => MaterialPageRoute(
                builder: (_) => const PinVerification(),
              ),
            "control_supervisory_body" => MaterialPageRoute(
                builder: (_) {
                  String lowName =
                      (settings.arguments as Map<String, String>)['lowName']!;
                  return BlocProvider(
                    create: (context) => sl<ControlSupervisoryBodyCubit>(),
                    child: ControlSupervisoryBody(
                      lowName: lowName,
                    ),
                  );
                },
              ),
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
                    child: Requirements(lowName: lowName, idControl: idControl),
                  );
                },
              ),
            'requirement_body' => MaterialPageRoute(
                builder: (_) {
                  final String lowName =
                      (settings.arguments as Map<String, dynamic>)['lowName'];
                  final int idControl =
                      (settings.arguments as Map<String, dynamic>)['idControl'];
                  final int idRequire =
                      (settings.arguments as Map<String, dynamic>)['idRequire'];
                  return BlocProvider(
                    create: (context) => sl<RequirementBodyCubit>()
                      ..init(lowName, idControl, idRequire),
                    child: const RequirementBody(),
                  );
                },
              ),
            "support" => MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => sl<SupportCubit>()..init(),
                  child: const Support(),
                ),
              ),
            "profile" => MaterialPageRoute(
                builder: (_) => const Profile(),
              ),
            "home" => MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => sl<ControlBodyCubit>()..init(),
                  child: const OneSignalWrapper(child: Home()),
                ),
              ),
            _ => MaterialPageRoute(
                builder: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          };
        },
        initialRoute: 'sign_in',
      ),
    );
  }
}
