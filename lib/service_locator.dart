import 'package:cyberbracy_mpt_original_front/data/datasource/auth_remote_datasource_impl.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/control_organ_data_source.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository_control.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/controller/pin_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/controller/sign_in_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/controller/sign_up_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/control_supervisory_body/state/control_supervisory_body_cubit.dart';
import 'package:cyberbracy_mpt_original_front/presentation/requirement/state/requirements_cubit.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/auth_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/data/repositories/auth_repository_impl.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'data/datasource/chat_remote_datasource.dart';
import 'data/datasource/chat_remote_datasource_impl.dart';
import 'data/repositories/chat_repository_impl.dart';
import 'domain/repositories/chat_repository.dart';
import 'domain/uses/get_max_pages.dart';
import 'domain/uses/get_messages.dart';
import 'domain/uses/send_message.dart';
import 'domain/uses/sign_in.dart';
import 'core/const/api_endpoints.dart';
import 'data/repositories/repository_control_impl.dart';
import 'domain/uses/sign_up.dart';
import 'domain/uses/verification.dart';
import 'presentation/home/state/control_body_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc / Cubit

  sl.registerFactory(() => ChatCubit(sl(), sl(), sl()));
  sl.registerFactory(() => ControlBodyCubit(sl()));
  sl.registerFactory(() => SignInCubit(signIn: sl()));
  sl.registerFactory(() => SignUpCubit(signUp: sl()));
  sl.registerFactory(() => PinCubit(verification: sl()));
  sl.registerFactory(() => ControlSupervisoryBodyCubit(sl()));
  sl.registerFactory(() => RequirementsCubit(sl()));

  // UseCase

  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => GetMessages(sl()));
  sl.registerLazySingleton(() => GetMaxPages(sl()));
  sl.registerLazySingleton(() => SignIn(signInRepository: sl()));
  sl.registerLazySingleton(() => SignUp(repository: sl()));
  sl.registerLazySingleton(() => Verification(repository: sl()));

  // Repository
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasource: sl()));
  sl.registerLazySingleton<RepositoryControl>(
      () => RepositoryControlImpl(sl()));

  // DataSource
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(sl.get(instanceName: 'api_first')));
  sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(sl.get(instanceName: 'api_second')));
  sl.registerLazySingleton<ControlOrganDataSource>(
    () => ControlOrganDataSourceImpl(sl.get(instanceName: 'api_first')),
  );

  // Core
  sl.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: ApiEndpoints.hostUrlFirst))
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
    instanceName: 'api_first'
  );
  sl.registerLazySingleton(
          () => Dio(BaseOptions(baseUrl: ApiEndpoints.hostUrlFirst))
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
      instanceName: 'api_second'
  );
}
