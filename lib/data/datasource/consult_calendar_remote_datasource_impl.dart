import 'package:cyberbracy_mpt_original_front/core/const/api_endpoints.dart';
import 'package:cyberbracy_mpt_original_front/core/error/exception.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/consult_calendar_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/data/models/consult_dates_model.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';
import 'package:dio/dio.dart';

class ConsultCalendarRemoteDataSourceImpl
    implements ConsultCalendarRemoteDataSource {
  final Dio _dio;

  ConsultCalendarRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ConsultDates>> getConsultDates(int id) async {
    try {
      var response =
          await _dio.get(ApiEndpoints.getConsultDates, queryParameters: {
        'userId': id,
      });
      var list = (response.data as List<dynamic>)
          .map((e) => ConsultDatesModel.fromJson((e as Map<String, dynamic>)))
          .toList();
      return list;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
