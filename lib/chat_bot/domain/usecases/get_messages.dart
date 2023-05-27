import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/repositories/chat_repository.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMessages extends UseCase<List<Message>, GetMessagesParams> {
  final ChatRepository chatRepository;

  GetMessages(this.chatRepository);
  @override
  Future<Either<Failure, List<Message>>> call(GetMessagesParams params) {
    return chatRepository.getHistoryMessage(params.id, params.page);
  }
}

class GetMessagesParams extends Equatable {
  final int id;
  final int page;

  const GetMessagesParams(this.id, this.page);

  @override
  List<Object?> get props => [id, page];
}
