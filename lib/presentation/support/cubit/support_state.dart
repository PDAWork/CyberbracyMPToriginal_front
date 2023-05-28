part of 'support_cubit.dart';

@immutable
abstract class SupportState {}

class SupportInitial extends SupportState {}

class SupportLoad extends SupportState {}

class SupportFailed extends SupportState {}

class SupportSeccuse extends SupportState {
  final List<ControlOrganEntity> controlOrganList;
final ControlOrganHeadEntity controlOrganHead;
  SupportSeccuse(this.controlOrganList, this.controlOrganHead);
}
