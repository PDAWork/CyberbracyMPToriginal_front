import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/control_organ_entity.dart';
import '../../../domain/entity/control_organ_head_entity.dart';
import '../../../domain/repositories/repository_control.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit(this.repositoryControl) : super(SupportInitial());

  final RepositoryControl repositoryControl;
  List<ControlOrganEntity> controlOrgan = [];
  ControlOrganHeadEntity? controlOrganHead;

  void init() async {
    emit(SupportLoad());

    final result =
        controlOrgan = (await repositoryControl.controlOrganAll()).$2;
    final result2 = controlOrganHead =
        await repositoryControl.controlOrganHead(result.first.lowName);

    if (result2 == null || result.isEmpty) {
      emit(SupportFailed());
    }

    emit(SupportSeccuse(result, result2!));
  }

  // void selectControlOrganHead(String lowName) async {
  //   emit(SupportLoad());
  //   final result = await repositoryControl.controlOrganHead(lowName);
  //   if (controlOrgan != null) {
  //     emit(SupportSeccuse(controlOrgan!, result!));
  //   }
  // }

  Future<void> getRequirments(String lowName) async {
    emit(SupportLoad());
    final result = await repositoryControl.requirementsAllByLowName(lowName);
    if (result != null) {
      emit(SupportRequirmentsLoaded(result, controlOrgan));
    }
  }
}
