import 'package:cyberbracy_mpt_original_front/const/api_endpoints.dart';
import 'package:cyberbracy_mpt_original_front/home/data/model/control_body_model.dart';
import 'package:dio/dio.dart';

class RepositoryControlBody {
  final Dio _dio;

  RepositoryControlBody(this._dio);

  Future<((bool,String), List<ControlBodyModel>)> controlBodyAll() async {
    try {
      final result = await _dio.get(ApiEndpoints.controlOrganAll);
      return (
          (true,''),
        (result.data as List).map((e) => ControlBodyModel.fromJson(e)).toList()
      );
    } on DioError catch (e) {
      (e.message!);
      return ((false,e.message ?? "Ошибка"), <ControlBodyModel>[]);
    }
  }
}
