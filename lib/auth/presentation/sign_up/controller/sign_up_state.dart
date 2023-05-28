import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_up_entiti.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpIntialState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadedState extends SignUpState {
  final SignUpEntiti signUpEntiti;

  SignUpLoadedState({required this.signUpEntiti});
  @override
  List<Object?> get props => [];
}

class SignUpErrorState extends SignUpState {
  final String message;

  SignUpErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
