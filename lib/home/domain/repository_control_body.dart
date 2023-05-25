import 'package:cyberbracy_mpt_original_front/home/data/model/control_body_model.dart';
import 'package:dio/dio.dart';

class RepositoryControlBody {
  final Dio _dio;

  RepositoryControlBody(this._dio);

  Future<((bool,String), List<ControlBodyModel>)> controlBodyAll() async {
    try {
      final result = await _dio.get('http://46.243.201.240:3077/org/list');
      return (
          (true,''),
        (result.data as List).map((e) => ControlBodyModel.fromJson(e)).toList()
      );
    } on DioError catch (e) {
      print(e.message!);
      return ((false,e.message ?? "Ошибка"), <ControlBodyModel>[]);
    }
  }
}
