import 'package:equatable/equatable.dart';

import '../../../../../domain/entity/sign_up_entiti.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitialState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadedState extends SignUpState {
  final SignUpEntity signUpEntity;

  SignUpLoadedState({required this.signUpEntity});
  @override
  List<Object?> get props => [];
}

class SignUpErrorState extends SignUpState {
  final String message;

  SignUpErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
