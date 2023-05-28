import 'package:equatable/equatable.dart';

abstract class PinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PinIntialState extends PinState {
  @override
  List<Object?> get props => [];
}

class PinLoadingState extends PinState {
  @override
  List<Object?> get props => [];
}

class PinLoadedState extends PinState {
  @override
  List<Object?> get props => [];
}

class PinErrorState extends PinState {
  final String message;

  PinErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
