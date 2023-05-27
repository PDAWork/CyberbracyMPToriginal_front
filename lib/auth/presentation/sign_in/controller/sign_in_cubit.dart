import 'package:cyberbracy_mpt_original_front/auth/domian/usecase/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/auth/presentation/sign_in/controller/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignIn signIn;
  SignInCubit({
    required this.signIn,
  }) : super(SignInIntialState());

  Future<void> signInUser(
      {required String email, required String password}) async {
    try {
      emit(SignInLoadingState());
      final result =
          await signIn.call(SignInParams(email: email, password: password));
      result.fold(
        (error) => emit(SignInErrorState(message: error.toString())),
        (data) => emit(SignInLoadedState()),
      );
    } catch (e) {
      emit(SignInErrorState(message: e.toString()));
    }
  }
}
