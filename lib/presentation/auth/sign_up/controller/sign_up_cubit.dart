import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_up/controller/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/uses/sign_up.dart';


class SignUpCubit extends Cubit<SignUpState>{
  final SignUp signUp;
  SignUpCubit({required this.signUp}):super(SignUpInitialState());

  Future<void> signUpUser(
      {required String email, required String password, required String firstName, required String lastName, required String phoneNumber}) async {
    try {
      emit(SignUpLoadingState());
      final result =
          await signUp.call(SignUpParams(email: email, password: password, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber));
      result.fold(
        (error) => emit(SignUpErrorState(message: error.toString())),
        (data) => emit(SignUpLoadedState(signUpEntity: data)),
      );
    } catch (e) {
      emit(SignUpErrorState(message: e.toString()));
    }
  }
}