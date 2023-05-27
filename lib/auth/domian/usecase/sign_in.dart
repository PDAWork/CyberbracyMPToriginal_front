import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_in_entiti.dart';
import 'package:cyberbracy_mpt_original_front/auth/domian/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase.dart';

class SignIn extends UseCase<SignInEntiti, SignInParams> {
  final Repository signInRepository;

  SignIn({required this.signInRepository});
  @override
  Future<Either<Failure, SignInEntiti>> call(SignInParams params) async {
    return await signInRepository.signIn(
        email: params.email, password: params.password);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}
