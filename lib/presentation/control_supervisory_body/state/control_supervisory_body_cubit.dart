import 'package:cyberbracy_mpt_original_front/domain/entity/control_supervisory_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/npas_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/control_organ_head_entity.dart';
import '../../../domain/repositories/repository_control.dart';

part 'control_supervisory_body_state.dart';

class ControlSupervisoryBodyCubit extends Cubit<ControlSupervisoryBodyState> {
  ControlSupervisoryBodyCubit(this.repositoryControl)
      : super(ControlSupervisoryBodyInitial());

  final RepositoryControl repositoryControl;

  init(String lowName) async {
    emit(ControlSupervisoryBodyLoad());

    final controlOrganHead = await repositoryControl.controlOrganHead(lowName);

    final controlSupervisoryOrgan =
        await repositoryControl.controlSupervisoryOrganAll(lowName);

    final npas = await repositoryControl.npasAll(lowName);

    if (controlOrganHead == null ||
        controlSupervisoryOrgan.isEmpty ||
        npas.isEmpty) {
      emit(ControlSupervisoryBodyFailed());
      return;
    }

    emit(ControlSupervisoryBodySeccuse(
        controlOrganHead, controlSupervisoryOrgan, npas));
  }
}
