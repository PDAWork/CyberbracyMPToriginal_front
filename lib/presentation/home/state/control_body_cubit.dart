import 'package:cyberbracy_mpt_original_front/domain/entity/control_organ_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/repositories/repository_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/models/control_organ_model.dart';
import '../../../data/repositories/repository_control_body.dart';

part 'control_body_state.dart';

class ControlBodyCubit extends Cubit<ControlBodyState> {
  ControlBodyCubit(this._repositoryControl) : super(ControlBodyInitial());

  // final RepositoryControlBody _repositoryControlBody;

  final RepositoryControl _repositoryControl;

  void init() {
    emit(ControlBodyLoad());
    _repositoryControl.controlOrganAll().then((value) {
      Future.delayed(const Duration(seconds: 1));
      value.$1.$1
          ? emit(ControlBodySeccuse(value.$2))
          : emit(ControlBodyFailed(value.$2, value.$1.$2));
    });
  }
}
