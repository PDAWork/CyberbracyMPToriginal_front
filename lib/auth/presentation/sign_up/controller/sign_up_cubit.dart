import 'package:cyberbracy_mpt_original_front/auth/presentation/sign_up/controller/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domian/usecase/sign_up.dart';

class SignUpCubit extends Cubit<SignUpState>{
  final SignUp signUp;
  SignUpCubit({required this.signUp}):super(SignUpIntialState());

  Future<void> signUpUser(
      {required String email, required String password, required String firstName, required String lastName, required String phoneNumber}) async {
    try {
      emit(SignUpLoadingState());
      final result =
          await signUp.call(SignUpParams(email: email, password: password, fisrtName: firstName, lastName: lastName, phoneNumber: phoneNumber));
      result.fold(
        (error) => emit(SignUpErrorState(message: error.toString())),
        (data) => emit(SignUpLoadedState(signUpEntiti: data)),
      );
    } catch (e) {
      emit(SignUpErrorState(message: e.toString()));
    }
  }
}