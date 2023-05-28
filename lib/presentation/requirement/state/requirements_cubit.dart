import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'requirements_state.dart';

class RequirementsCubit extends Cubit<RequirementsState> {
  RequirementsCubit(this.repositoryControl) : super(RequirementsInitial());

  final RepositoryControl repositoryControl;

  init(String lowName, int idControl) async {
    emit(RequirementsLoad());

    final result = await repositoryControl.requirementsAll(lowName, idControl);

    if (result.isEmpty) {
      return emit(RequirementsFailed());
    }

    emit(RequirementsSeccuse(result));
  }
}
