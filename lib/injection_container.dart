import 'package:cyberbracy_mpt_original_front/chat_bot/data/datasource/remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/data/datasource/remote_datasource_impl.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/data/repository/char_repository_impl.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/repositories/chat_repository.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/usecases/send_message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/presentation/cubit/chat_cubit.dart';
import 'package:cyberbracy_mpt_original_front/const/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract final class DIContainer {
  static final instance = GetIt.asNewInstance();

  static void initialize() {
    //Bloc instances
    instance.registerFactory(() => ChatCubit(instance()));

    //UseCase instances
    instance.registerLazySingleton(() => SendMessage(instance()));

    //Repository instances
    instance.registerLazySingleton<ChatRepository>(
        () => ChatRepositoryImpl(instance()));

    //Datasource instances
    instance.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(instance()));

    instance.registerLazySingleton(
        () => Dio(BaseOptions(baseUrl: ApiEndpoints.hostUrl)));
  }
}
