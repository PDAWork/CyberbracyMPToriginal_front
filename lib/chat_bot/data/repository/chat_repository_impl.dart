import 'package:cyberbracy_mpt_original_front/chat_bot/data/datasource/remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/repositories/chat_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Message>>> sendMessage(
      int userId, String message) async {
    return await _sendMessage(
        () => remoteDataSource.sendMessage(userId, message));
  }

  Future<Either<Failure, List<Message>>> _sendMessage(
      Future<List<Message>> Function() message) async {
    try {
      final model = await message();
      return Right(model);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
