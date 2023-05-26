import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';

abstract interface class ChatRemoteDataSource {
  ///Post message
  ///
  ///Throws [ServerException] for all code errors
  Future<List<Message>> sendMessage(int userId, String message);
}
