import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInIntialState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoadingState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoadedState extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
