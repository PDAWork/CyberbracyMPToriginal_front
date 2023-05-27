import 'package:cyberbracy_mpt_original_front/auth/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_in_entiti.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_up_entiti.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class RepositoryImpl implements Repository {
  final SignInRemoteDatasource remoteDatasource;

  RepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, SignInEntiti>> signIn(
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
  Future<Either<Failure, SignUpEntiti>> signUp(
      {required String email,
      required String fisrtName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {
    try {
      final data = await remoteDatasource.signUp(
          email: email,
          fisrtName: fisrtName,
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
