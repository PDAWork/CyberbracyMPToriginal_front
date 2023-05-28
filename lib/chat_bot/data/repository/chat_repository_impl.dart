import 'package:cyberbracy_mpt_original_front/chat_bot/data/datasource/remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/entity/message.dart';
import 'package:cyberbracy_mpt_original_front/chat_bot/domain/repositories/chat_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, Message>> sendMessage(
      int userId, String message) async {
    return await _sendMessage(
        () => remoteDataSource.sendMessage(userId, message));
  }

  Future<Either<Failure, Message>> _sendMessage(
      Future<Message> Function() message) async {
    try {
      final model = await message();
      return Right(model);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getHistoryMessage(
      int id, int page) async {
    return await _getHistoryMessage(
        () => remoteDataSource.getMessagesHistory(id, page));
  }

  Future<Either<Failure, List<Message>>> _getHistoryMessage(
      Future<List<Message>> Function() message) async {
    try {
      final model = await message();
      return Right(model);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getMaxPages(int id) {
    return _getMaxPages(() => remoteDataSource.getMaxPages(id));
  }

  Future<Either<Failure, int>> _getMaxPages(
      Future<int> Function() maxPages) async {
    try {
      final model = await maxPages();
      return Right(model);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
