import 'package:cyberbracy_mpt_original_front/home/domain/repository_control_body.dart';
import 'package:cyberbracy_mpt_original_front/home/state/control_body_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => ControlBodyCubit(sl()));

  sl.registerLazySingleton(() => RepositoryControlBody(sl()));

  sl.registerLazySingleton(
    () => Dio()
      ..interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ],
      ),
  );
}
