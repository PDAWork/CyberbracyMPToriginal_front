import 'dart:convert';

import 'package:cyberbracy_mpt_original_front/core/const/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;
  final storage = const FlutterSecureStorage();

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<SignInModel> signIn(
      {required String email, required String password}) async {
    try {
      final Response response = await dio.post(ApiEndpoints.signIn,
          data: jsonEncode(
            {
              'email': email,
              'password': password,
            },
          ));
      return SignInModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.response?.statusCode == 400) {
        throw 'Вы ввели не верные данные';
      }
      throw 'Что-то пошло не так';
    }
  }

  @override
  Future<SignUpModel> signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {
    try {
      final Response response = await dio.post(
        ApiEndpoints.signUp,
        data: jsonEncode(
          {
            'email': email,
            'firstName': firstName,
            'lastName': lastName,
            'phone_number': phoneNumber,
            'password': password,
          },
        ),
      );
      return SignUpModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.response?.statusCode == 400) {
        throw 'Вы ввели не верные данные';
      }
      throw 'Что-то пошло не так';
    }
  }

  @override
  Future<void> verification({required String code, required int id}) async {
    try {
      final Response response = await dio.post(
        ApiEndpoints.verif,
        data: jsonEncode(
          {
            'id_user': id,
            'code': code,
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw e.toString();
    }
  }
}
