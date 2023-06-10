import 'package:cyberbracy_mpt_original_front/data/datasource/auth_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/auth_remote_datasource_impl.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/consult_calendar_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/consult_calendar_remote_datasource_impl.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/control_organ_data_source.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/who_am_i_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/who_am_i_remote_datasource_impl.dart';
import 'package:cyberbracy_mpt_original_front/data/repositories/auth_repository_impl.dart';
import 'package:cyberbracy_mpt_original_front/data/repositories/consult_calendar_repository_impl.dart';
import 'package:cyberbracy_mpt_original_front/data/repositories/who_am_i_repository_impl.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/auth_repository.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/consult_calendar.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository_control.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/who_am_i.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/get_all_consult_dates.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/get_consult_dates.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/sign_up_on_consult.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/who_am_i.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/controller/pin_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/controller/sign_in_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/controller/sign_up_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/cubit/consult_calendar_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/state/control_supervisory_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/state/requirements_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement_body/state/requirement_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/support/cubit/support_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/video_call/controller/video_call_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/const/api_endpoints.dart';
import 'data/datasource/chat_remote_datasource.dart';
import 'data/datasource/chat_remote_datasource_impl.dart';
import 'data/repositories/chat_repository_impl.dart';
import 'data/repositories/repository_control_impl.dart';
import 'domain/repositories/chat_repository.dart';
import 'domain/uses/get_max_pages.dart';
import 'domain/uses/get_messages.dart';
import 'domain/uses/send_message.dart';
import 'domain/uses/sign_in.dart';
import 'domain/uses/sign_up.dart';
import 'domain/uses/verification.dart';
import 'presentation/home/state/control_body_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //OneSignal
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("8ced7149-ca5f-471c-b828-23677f82feb7");

  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission();
  // Bloc / Cubit

  sl.registerFactory(() => ChatCubit(sl(), sl(), sl()));
  sl.registerFactory(() => ControlBodyCubit(sl()));
  sl.registerFactory(() => SignInCubit(signIn: sl(), sl()));
  sl.registerFactory(() => ConsultCalendarCubit(sl()));
  sl.registerFactory(() => SignUpCubit(signUp: sl()));
  sl.registerFactory(() => PinCubit(verification: sl()));
  sl.registerFactory(() => ControlSupervisoryBodyCubit(sl()));
  sl.registerFactory(() => RequirementsCubit(sl()));
  sl.registerFactory(() => RequirementBodyCubit(sl()));
  sl.registerFactory(() => SupportCubit(sl(), sl(), sl()));
  sl.registerFactory(() => VideoCallCubit());

  // UseCase

  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => GetMessages(sl()));
  sl.registerLazySingleton(() => WhoAmI(sl()));
  sl.registerLazySingleton(() => GetConsultDates(sl()));
  sl.registerLazySingleton(() => GetMaxPages(sl()));
  sl.registerLazySingleton(() => SignIn(signInRepository: sl()));
  sl.registerLazySingleton(() => SignUp(repository: sl()));
  sl.registerLazySingleton(() => Verification(repository: sl()));
  sl.registerLazySingleton(() => GetAllConsultDates(sl()));
  sl.registerLazySingleton(() => SignUpOnConsult(sl()));

  // Repository
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: sl()));
  sl.registerLazySingleton<RepositoryControl>(
      () => RepositoryControlImpl(sl()));
  sl.registerLazySingleton<ConsultCalendarRepository>(
      () => ConsultCalendarRepositoryImpl(sl()));
  sl.registerLazySingleton<WhoAmIRepository>(() => WhoAmIRepositoryImpl(sl()));

  // DataSource
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(sl.get(instanceName: 'api_first')));
  sl.registerLazySingleton<ConsultCalendarRemoteDataSource>(() =>
      ConsultCalendarRemoteDataSourceImpl(sl.get(instanceName: 'api_first')));
  sl.registerLazySingleton<WhoAmIRemoteDataSource>(
      () => WhoAmIRemoteDataSourceImpl(sl.get(instanceName: 'api_second')));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDatasourceImpl(sl.get(instanceName: 'api_second')));
  sl.registerLazySingleton<ControlOrganDataSource>(
    () => ControlOrganDataSourceImpl(sl.get(instanceName: 'api_first')),
  );

  // Core
  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: ApiEndpoints.hostUrlKotlin))
        ..interceptors.addAll(
          [
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              error: true,
              compact: true,
              maxWidth: 90,
            ),
          ],
        ),
      instanceName: 'api_first');
  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: ApiEndpoints.hostUrlPython))
        ..interceptors.addAll(
          [
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              error: true,
              compact: true,
              maxWidth: 90,
            ),
          ],
        ),
      instanceName: 'api_second');
}
