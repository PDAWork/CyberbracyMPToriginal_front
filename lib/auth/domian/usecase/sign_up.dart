import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_up_entiti.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/repository/repository.dart';
import 'package:cyberbracy_mpt_original_front/core/error/failure.dart';
import 'package:cyberbracy_mpt_original_front/core/usecase.dart';
import 'package:dartz/dartz.dart';

class SignUp extends UseCase<SignUpEntiti, SignUpParams> {
  final Repository repository;

  SignUp({required this.repository});
  @override
  Future<Either<Failure, SignUpEntiti>> call(SignUpParams params) async {
    return await repository.signUp(
        email: params.email,
        fisrtName: params.fisrtName,
        lastName: params.lastName,
        phoneNumber: params.phoneNumber,
        password: params.password);
  }
}

class SignUpParams {
  final String email;
  final String fisrtName;
  final String lastName;
  final String phoneNumber;
  final String password;

  SignUpParams(
      {required this.email,
      required this.fisrtName,
      required this.lastName,
      required this.phoneNumber,
      required this.password});
}
