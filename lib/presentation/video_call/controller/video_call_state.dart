import 'package:equatable/equatable.dart';

abstract class VideoCallState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideoCallInitialState extends VideoCallState {
  @override
  List<Object?> get props => [];
}

class VideoCallLoadingState extends VideoCallState {
  @override
  List<Object?> get props => [];
}

class VideoCallLoadedState extends VideoCallState {
  final String roomId;
  VideoCallLoadedState({required this.roomId});
  @override
  List<Object?> get props => [roomId];
}

class VideoCallErrorState extends VideoCallState {
  final String message;

  VideoCallErrorState({required this.message});
}
