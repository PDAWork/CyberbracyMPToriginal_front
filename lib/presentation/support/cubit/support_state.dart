part of 'support_cubit.dart';

abstract class SupportState {}

class SupportInitial extends SupportState {}

class SupportLoad extends SupportState {}

class SupportFailed extends SupportState {}

class SupportSeccuse extends SupportState {
  final List<ControlOrganEntity> controlOrganList;
  final ControlOrganHeadEntity controlOrganHead;
  SupportSeccuse(this.controlOrganList, this.controlOrganHead);
}

class SupportRequirmentsLoaded extends SupportState {
  final List<ControlOrganEntity> controlOrganList;
  final List<RequirementsEntity> requirments;

  SupportRequirmentsLoaded(this.requirments, this.controlOrganList);
}
