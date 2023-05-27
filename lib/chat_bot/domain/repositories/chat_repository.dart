import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class ChatRepository {
  ///Send message on http://46.243.201.240:3077/onmessage?userId=1&message=asd
  Future<Either<Failure, List<Message>>> sendMessage(
      int userId, String message);
}
