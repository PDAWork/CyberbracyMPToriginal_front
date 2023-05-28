import 'package:cyberbracy_mpt_original_front/core/const/api_endpoints.dart';
import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/core/error/exception.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/who_am_i_remote_datasource.dart';
import 'package:dio/dio.dart';

class WhoAmIRemoteDataSourceImpl implements WhoAmIRemoteDataSource {
  final Dio _dio;

  WhoAmIRemoteDataSourceImpl(this._dio);
  @override
  Future<UserId> whoAmI() async {
    try {
      var response = await _dio.get(ApiEndpoints.whoAmI);
      return response.data['id'];
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
