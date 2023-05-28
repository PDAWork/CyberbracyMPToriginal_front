import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/get_max_pages.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/get_messages.dart';
import 'package:cyberbracy_mpt_original_front/auth/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/auth/data/repository/repository_impl.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/repository/repository.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/usecase/sign_up.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/usecase/verification.dart';
import 'package:cyberbracy_mpt_original_front/auth/presentation/pin_verification/controller/pin_cubit.dart';
import 'package:cyberbracy_mpt_original_front/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:cyberbracy_mpt_original_front/auth/presentation/sign_up/controller/sign_up_cubit.dart';
import 'package:cyberbracy_mpt_original_front/home/domain/repository_control_body.dart';
import 'package:cyberbracy_mpt_original_front/home/state/control_body_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'auth/data/datasource/remote_datasource/remote_datasource_impl.dart';
import 'auth/domian/usecase/sign_in.dart';
import 'chat_bot/data/datasource/remote_datasource.dart';
import 'chat_bot/data/datasource/remote_datasource_impl.dart';
import 'chat_bot/data/repository/chat_repository_impl.dart';
import 'chat_bot/domain/repositories/chat_repository.dart';
import 'chat_bot/domain/usecases/send_message.dart';
import 'chat_bot/presentation/cubit/chat_cubit.dart';
import 'core/const/api_endpoints.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Bloc instances
  sl.registerFactory(() => ChatCubit(sl(), sl(), sl()));
  sl.registerFactory(() => ControlBodyCubit(sl()));
  sl.registerFactory(() => SignInCubit(signIn: sl()));
  sl.registerFactory(() => SignUpCubit(signUp: sl()));
  sl.registerFactory(() => PinCubit(verification: sl()));

  //UseCase instances
  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => GetMessages(sl()));
  sl.registerLazySingleton(() => GetMaxPages(sl()));
  sl.registerLazySingleton(() => SignIn(signInRepository: sl()));
  sl.registerLazySingleton(() => SignUp(repository: sl()));
  sl.registerLazySingleton(() => Verification(repository: sl()));

  //Repository instances
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));
  sl.registerLazySingleton(() => RepositoryControlBody(sl()));
  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDatasource: sl()));

  //Datasource instances
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SignInRemoteDatasource>(
      () => SignInRemoteDatasourceImpl());

  //
  sl.registerLazySingleton(
    () => Dio(BaseOptions(baseUrl: ApiEndpoints.hostUrl))
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
  );
}
