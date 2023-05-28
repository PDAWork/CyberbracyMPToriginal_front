import 'package:cyberbracy_mpt_original_front/data/datasource/auth_remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entity/sign_in_entiti.dart';
import '../../domain/entity/sign_up_entiti.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, SignInEntity>> signIn(
      {required String email, required String password}) async {
    try {
      final data =
          await remoteDatasource.signIn(email: email, password: password);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SignUpEntity>> signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {
    try {
      final data = await remoteDatasource.signUp(
          email: email,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          password: password);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> verificationCode(
      {required int id, required String code}) async {
    try {
      final data = await remoteDatasource.verification(code: code, id: id);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
