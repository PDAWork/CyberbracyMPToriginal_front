import 'package:cyberbracy_mpt_original_front/data/datasource/control_organ_data_source.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository_control.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'data/repositories/repository_control_impl.dart';
import 'presentation/home/state/control_body_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc / Cubit

  sl.registerFactory(() => ControlBodyCubit(sl()));

  // UseCase

  // Repository
  sl.registerLazySingleton<RepositoryControl>(
      () => RepositoryControlImpl(sl()));

  // DataSource
  sl.registerLazySingleton<ControlOrganDataSource>(
    () => ControlOrganDataSourceImpl(sl()),
  );

  // Core

  // External

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
