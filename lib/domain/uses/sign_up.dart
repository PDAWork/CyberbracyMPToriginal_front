import 'package:cyberbracy_mpt_original_front/domain/repositories/repository.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entity/sign_up_entiti.dart';

class SignUp extends UseCase<SignUpEntity, SignUpParams> {
  final Repository repository;

  SignUp({required this.repository});
  @override
  Future<Either<Failure, SignUpEntity>> call(SignUpParams params) async {
    return await repository.signUp(
        email: params.email,
        firstName: params.firstName,
        lastName: params.lastName,
        phoneNumber: params.phoneNumber,
        password: params.password);
  }
}

class SignUpParams {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;

  SignUpParams(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.password});
}
