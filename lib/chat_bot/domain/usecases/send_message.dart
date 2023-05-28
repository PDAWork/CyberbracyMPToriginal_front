import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/repositories/chat_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SendMessage extends UseCase<Message, SendMessageParams> {
  final ChatRepository chatRepository;

  SendMessage(this.chatRepository);
  @override
  Future<Either<Failure, Message>> call(SendMessageParams params) {
    return chatRepository.sendMessage(params.userId, params.message);
  }
}

class SendMessageParams extends Equatable {
  final int userId;
  final String message;

  const SendMessageParams(this.userId, this.message);

  @override
  List<Object?> get props => [userId, message];
}
