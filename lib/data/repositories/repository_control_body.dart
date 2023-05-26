import 'package:cyberbracy_mpt_original_front/data/datasource/control_organ_data_source.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:dio/dio.dart';

import '../../domain/repositories/repository_control.dart';
import '../models/control_organ_model.dart';

class RepositoryControlBody {
  final Dio _dio;

  RepositoryControlBody(this._dio);

  Future<((bool, String), List<ControlOrganModel>)> controlBodyAll() async {
    try {
      final result = await _dio.get('http://46.243.201.240:3077/org/list');
      return (
        (true, ''),
        (result.data as List).map((e) => ControlOrganModel.fromJson(e)).toList()
      );
    } on DioError catch (e) {
      (e.message!);
      return ((false, e.message ?? "Ошибка"), <ControlOrganModel>[]);
    }
  }
}

class RepositoryControlImpl implements RepositoryControl {
  final ControlOrganDataSource _dataSource;

  RepositoryControlImpl(this._dataSource);

  @override
  Future<((bool, String), List<ControlOrganEntity>)> controlOrganAll() async {
    final list = await _dataSource.getAllControlOrgan();
    if (list.isEmpty) {
      return ((false, 'Ошибка'), list);
    }
    return ((true, ''), list);
  }
}
