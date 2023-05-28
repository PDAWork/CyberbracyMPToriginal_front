import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/chat_repository.dart';

class GetMaxPages extends UseCase<int, GetMaxPagesParams> {
  final ChatRepository chatRepository;

  GetMaxPages(this.chatRepository);
  @override
  Future<Either<Failure, int>> call(GetMaxPagesParams params) {
    return chatRepository.getMaxPages(params.id);
  }
}

class GetMaxPagesParams extends Equatable {
  final int id;

  const GetMaxPagesParams(this.id);

  @override
  List<Object?> get props => [id];
}
