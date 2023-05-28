import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_in_entiti.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_up_entiti.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class Repository {
  Future<Either<Failure, SignInEntiti>> signIn(
      {required String email, required String password});
  Future<Either<Failure, SignUpEntiti>> signUp(
      {required String email,
      required String fisrtName,
      required String lastName,
      required String phoneNumber,
      required String password});
  Future<Either<Failure, void>> verificationCode({required int id, required String code}); 
}
