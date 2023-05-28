import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entity/message.dart';
import '../repositories/chat_repository.dart';

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
