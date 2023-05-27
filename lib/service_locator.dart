import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/get_max_pages.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/get_messages.dart';
import 'package:cyberbracy_mpt_original_front/home/domain/repository_control_body.dart';
import 'package:cyberbracy_mpt_original_front/home/state/control_body_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'chat_bot/data/datasource/remote_datasource.dart';
import 'chat_bot/data/datasource/remote_datasource_impl.dart';
import 'chat_bot/data/repository/chat_repository_impl.dart';
import 'chat_bot/domain/repositories/chat_repository.dart';
import 'chat_bot/domain/usecases/send_message.dart';
import 'chat_bot/presentation/cubit/chat_cubit.dart';
import 'const/api_endpoints.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc instances
  sl.registerFactory(() => ChatCubit(sl(), sl(), sl()));
  sl.registerFactory(() => ControlBodyCubit(sl()));

  //UseCase instances
  sl.registerLazySingleton(() => SendMessage(sl()));
  sl.registerLazySingleton(() => GetMessages(sl()));
  sl.registerLazySingleton(() => GetMaxPages(sl()));

  //Repository instances
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));
  sl.registerLazySingleton(() => RepositoryControlBody(sl()));

  //Datasource instances
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl(sl()));

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
