part of 'one_signal_wrapper_cubit.dart';

abstract class OneSignalWrapperState extends Equatable {
  const OneSignalWrapperState();

  @override
  List<Object> get props => [];
}

class OneSignalWrapperInitial extends OneSignalWrapperState {}

class OneSignalWrapperIos extends OneSignalWrapperState {
  final String roomId;
  final int toId;
  final int fromId;

  const OneSignalWrapperIos(this.roomId, this.toId, this.fromId);
}

class OneSignalWrapperAndoid extends OneSignalWrapperState {
  final String roomId;
  final int toId;
  final int fromId;

  const OneSignalWrapperAndoid(this.roomId, this.toId, this.fromId);
}
