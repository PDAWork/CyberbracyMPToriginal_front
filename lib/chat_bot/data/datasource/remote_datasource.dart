import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';

abstract interface class ChatRemoteDataSource {
  ///Post message
  ///
  ///Throws [ServerException] for all code errors
  Future<Message> sendMessage(int userId, String message);

  ///Get messages history
  ///
  ///Throws [ServerException] for all code errors
  Future<List<Message>> getMessagesHistory(int id, int page);

  ///Get messages history max pages
  ///
  ///Throws [ServerException] for all code errors
  Future<int> getMaxPages(int id);
}
