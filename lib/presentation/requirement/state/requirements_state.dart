part of 'requirements_cubit.dart';

@immutable
abstract class RequirementsState {}

class RequirementsInitial extends RequirementsState {}

class RequirementsLoad extends RequirementsState {}

class RequirementsFailed extends RequirementsState {}

class RequirementsSeccuse extends RequirementsState {
  final List<RequirementsEntity> requirements;

  RequirementsSeccuse(this.requirements);
}
