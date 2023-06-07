import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/get_all_consult_dates.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/control_organ_entity.dart';
import '../../../domain/entity/control_organ_head_entity.dart';
import '../../../domain/repositories/repository_control.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  final GetAllConsultDates _getAllConsultDates;
  SupportCubit(this.repositoryControl, this._getAllConsultDates)
      : super(SupportInitial());

  final RepositoryControl repositoryControl;
  List<ControlOrganEntity> controlOrgan = [];

  void init() async {
    emit(SupportLoad());

    final result =
        controlOrgan = (await repositoryControl.controlOrganAll()).$2;

    if (result.isEmpty) {
      emit(SupportFailed());
    }

    emit(SupportSeccuse(result));
  }

  Future<void> getRequirments(String lowName) async {
    emit(SupportLoad());
    final result = await repositoryControl.requirementsAllByLowName(lowName);
    final dates =
        await _getAllConsultDates.call(GetAllConsultDatesParams(lowName));
    dates.fold(
      (error) => null,
      (data) {
        if (result != null) {
          emit(
            SupportRequirmentsLoaded(result, controlOrgan, data),
          );
        }
      },
    );
  }
}
