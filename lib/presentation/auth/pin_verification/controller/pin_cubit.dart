import 'package:cyberbracy_mpt_original_front/presentation/auth/pin_verification/controller/pin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/uses/verification.dart';

class PinCubit extends Cubit<PinState> {
  final Verification verification;
  PinCubit({required this.verification}) : super(PinIntialState());

  Future<void> userVerification({required String code, required int id}) async {
    try {
      emit(PinLoadingState());
      final result =
          await verification.call(VerificationParams(id: id, code: code));
      result.fold(
        (error) => emit(PinErrorState(message: error.toString())),
        (data) => emit(PinLoadedState()),
      );
    } catch (error) {
      emit(PinErrorState(message: error.toString()));
    }
  }
}
