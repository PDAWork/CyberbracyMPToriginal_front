import 'package:cyberbracy_mpt_original_front/domain/entity/requirement_body_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'requirement_body_state.dart';

class RequirementBodyCubit extends Cubit<RequirementBodyState> {
  RequirementBodyCubit(this.repositoryControl)
      : super(RequirementBodyInitial());

  final RepositoryControl repositoryControl;

  init(String lowName, int idControl, int idRequire) async {
    emit(RequirementBodyLoad());

    final result = await repositoryControl.requirementBodyEntityAll(
        lowName, idControl, idRequire);

    if (result == null) {
      emit(RequirementBodyFailed());
      return;
    }

    emit(RequirementBodySeccuse(result));
  }
}
