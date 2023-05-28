import 'package:cyberbracy_mpt_original_front/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase.dart';
import '../entity/sign_in_entiti.dart';

class SignIn extends UseCase<SignInEntity, SignInParams> {
  final Repository signInRepository;

  SignIn({required this.signInRepository});

  @override
  Future<Either<Failure, SignInEntity>> call(SignInParams params) async {
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
