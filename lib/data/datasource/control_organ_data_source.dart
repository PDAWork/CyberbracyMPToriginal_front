import 'package:cyberbracy_mpt_original_front/data/models/control_organ_model.dart';
import 'package:dio/dio.dart';

abstract class ControlOrganDataSource {
  /// [GET] http://:3077/data/org/list
  /// Получить список КНО
  Future<List<ControlOrganModel>> getAllControlOrgan();
}

class ControlOrganDataSourceImpl implements ControlOrganDataSource {
  final Dio _dio;

  ControlOrganDataSourceImpl(this._dio);

  @override
  Future<List<ControlOrganModel>> getAllControlOrgan() async {
    try {
      final result = await _dio.get('http://46.243.201.240:3077/data/org/list');
      return (result.data as List)
          .map((e) => ControlOrganModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      return <ControlOrganModel>[];
    }
  }
}
