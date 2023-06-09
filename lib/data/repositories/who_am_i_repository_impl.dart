import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/data/datasource/who_am_i_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/who_am_i.dart';
import 'package:dartz/dartz.dart';

class WhoAmIRepositoryImpl implements WhoAmIRepository {
  final WhoAmIRemoteDataSource _whoAmIRemoteDataSource;

  WhoAmIRepositoryImpl(this._whoAmIRemoteDataSource);

  @override
  Future<Either<Failure, UserId>> whoAmI() async {
    return await _whoAmI(() => _whoAmIRemoteDataSource.whoAmI());
  }

  Future<Either<Failure, UserId>> _whoAmI(
      Future<UserId> Function() date) async {
    try {
      final model = await date();
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e is Failure ? e.message : e.toString()));
    }
  }
}
