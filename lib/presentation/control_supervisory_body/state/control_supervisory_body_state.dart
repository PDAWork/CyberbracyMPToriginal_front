part of 'control_supervisory_body_cubit.dart';

@immutable
abstract class ControlSupervisoryBodyState {}

class ControlSupervisoryBodyInitial extends ControlSupervisoryBodyState {}

class ControlSupervisoryBodyLoad extends ControlSupervisoryBodyState {}

class ControlSupervisoryBodyFailed extends ControlSupervisoryBodyState {}

class ControlSupervisoryBodySeccuse extends ControlSupervisoryBodyState {
  final ControlOrganHeadEntity controlOrganHeadEntity;
  final List<ControlSupervisoryOrganEntity> controlSupervisoryOrganEntity;
  final List<NpasEntity> npasEntity;

  ControlSupervisoryBodySeccuse(
    this.controlOrganHeadEntity,
    this.controlSupervisoryOrganEntity,
    this.npasEntity,
  );
}
