part of 'requirement_body_cubit.dart';

@immutable
abstract class RequirementBodyState {}

class RequirementBodyInitial extends RequirementBodyState {}

class RequirementBodyLoad extends RequirementBodyInitial {}

class RequirementBodyFailed extends RequirementBodyInitial {}

class RequirementBodySeccuse extends RequirementBodyInitial {
  final RequirementBodyEntity requirement;

  RequirementBodySeccuse(this.requirement);
}
