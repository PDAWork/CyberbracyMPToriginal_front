part of 'control_body_cubit.dart';

@immutable
abstract class ControlBodyState {}

class ControlBodyInitial extends ControlBodyState {}

class ControlBodyLoad extends ControlBodyState {}

class ControlBodySeccuse extends ControlBodyState {
  final List<ControlBodyModel> list;

  ControlBodySeccuse(this.list);
}

class ControlBodyFailed extends ControlBodyState {
  final List<ControlBodyModel> list;
  final String errorMesage;

  ControlBodyFailed(this.list, this.errorMesage);
}
