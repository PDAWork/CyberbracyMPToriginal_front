import 'package:cyberbracy_mpt_original_front/domain/entity/sign_up_entiti.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/sign_in_entiti.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInEntity>> signIn(
      {required String email, required String password});
  Future<Either<Failure, SignUpEntity>> signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password});
  Future<Either<Failure, void>> verificationCode({required int id, required String code}); 
}
