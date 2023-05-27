import 'package:cyberbracy_mpt_original_front/chat_bot/data/datasource/remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/data/models/message_dto.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/const/api_endpoints.dart';
import 'package:cyberbracy_mpt_original_front/core/error/exception.dart';
import 'package:dio/dio.dart';

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final Dio _dio;

  ChatRemoteDataSourceImpl(this._dio);

  @override
  Future<Message> sendMessage(int userId, String message) async {
    try {
      var response = await _dio.post(ApiEndpoints.message, queryParameters: {
        'userId': userId,
        'message': message,
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        // final List<Message> list = [];
        // for (var element in response.data['text']) {
        //   var map = {
        //     'message': element,
        //     'timestamp': response.data['timestamp'],
        //     'bot': response.data['bot']
        //   };

        return MessageDto.fromJson(response.data);
      } else if (response.statusCode! >= 400 && response.statusCode! <= 499) {
        throw ClientException(response.statusMessage ??
            'Something went wrong in sendMessage method');
      } else if (response.statusCode! >= 500 && response.statusCode! <= 599) {
        throw ServerException(response.statusMessage ??
            'Something went wrong in sendMessage method');
      } else {
        throw Exception();
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Message>> getMessagesHistory(int id, int page) async {
    try {
      var response =
          await _dio.get(ApiEndpoints.getMessageHistory, queryParameters: {
        'id': id,
        'page': page,
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        // final List<Message> list = [];
        var list = (response.data as List<dynamic>)
            .map((e) => MessageDto.fromJson((e as Map<String, dynamic>)))
            .toList();
        return list;
      } else if (response.statusCode! >= 400 && response.statusCode! <= 499) {
        throw ClientException(response.statusMessage ??
            'Something went wrong in sendMessage method');
      } else if (response.statusCode! >= 500 && response.statusCode! <= 599) {
        throw ServerException(response.statusMessage ??
            'Something went wrong in sendMessage method');
      } else {
        throw Exception();
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<int> getMaxPages(int id) async {
    try {
      var response =
          await _dio.get(ApiEndpoints.maxPages, queryParameters: {'id': id});
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        // final List<Message> list = [];
        return response.data;
      } else if (response.statusCode! >= 400 && response.statusCode! <= 499) {
        throw ClientException(response.statusMessage ??
            'Something went wrong in sendMessage method');
      } else if (response.statusCode! >= 500 && response.statusCode! <= 599) {
        throw ServerException(response.statusMessage ??
            'Something went wrong in sendMessage method');
      } else {
        throw Exception();
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
