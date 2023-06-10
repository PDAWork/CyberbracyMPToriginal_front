import 'package:cyberbracy_mpt_original_front/core/const/api_endpoints.dart';
import 'package:cyberbracy_mpt_original_front/core/error/exception.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/consult_calendar_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/data/models/consult_dates_model.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/consult_date.dart';
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

  @override
  Future<List<ConsultDates>> getAllConsultDates(String lowName) async {
    try {
      var response = await _dio.get(
        ApiEndpoints.getAllConsultDates,
        queryParameters: {
          'lowName': lowName,
        },
      );
      var list = (response.data as List<dynamic>)
          .map((e) => ConsultDatesModel.fromJson((e as Map<String, dynamic>)))
          .toList();
      return list;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signUpOnConsult(int userId, String lowName, int idControl,
      int idRequire, int timestamp, String question) async {
    try {
      var response = await _dio.post(
        ApiEndpoints.signUpOnConsult,
        queryParameters: {
          'userId': userId,
          'lowName': lowName,
          'idControl': idControl,
          'idRequire': idRequire,
          'from': timestamp,
          'question': question,
        },
      );
      return response.data['msg'];
    } on DioError catch (e) {
      if (e.response?.statusCode == 440) {
        throw ServerException(e.response?.data['msg']);
      } else {
        throw ServerException(e.toString());
      }
    }
  }

  @override
  Future<String> confirmConsult(
      int userId, int timestamp, String lowName) async {
    try {
      var response = await _dio.post(
        ApiEndpoints.confirmConsult,
        queryParameters: {
          'userId': userId,
          'lowName': lowName,
          'from': timestamp,
        },
      );
      return response.data['msg'];
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
