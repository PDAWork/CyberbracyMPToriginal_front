import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberbracy_mpt_original_front/home/data/model/control_body_model.dart';
import 'package:cyberbracy_mpt_original_front/home/domain/repository_control_body.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'control_body_state.dart';

class ControlBodyCubit extends Cubit<ControlBodyState> {
  ControlBodyCubit(this._repositoryControlBody) : super(ControlBodyInitial());

  final RepositoryControlBody _repositoryControlBody;

  void init() {
    emit(ControlBodyLoad());
    _repositoryControlBody.controlBodyAll().then((value) {
      Future.delayed(const Duration(seconds: 1));
      value.$1.$1
          ? emit(ControlBodySeccuse(value.$2))
          : emit(ControlBodyFailed(value.$2, value.$1.$2));
    });
  }
}
