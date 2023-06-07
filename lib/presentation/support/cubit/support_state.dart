part of 'support_cubit.dart';

abstract class SupportState {}

class SupportInitial extends SupportState {}

class SupportLoad extends SupportState {}

class SupportFailed extends SupportState {}

class SupportSeccuse extends SupportState {
  final List<ControlOrganEntity> controlOrganList;
  SupportSeccuse(this.controlOrganList);
}

class SupportRequirmentsLoaded extends SupportState {
  final List<ControlOrganEntity> controlOrganList;
  final List<RequirementsEntity> requirments;
  final List<ConsultDates> dates;

  SupportRequirmentsLoaded(this.requirments, this.controlOrganList, this.dates);
}
