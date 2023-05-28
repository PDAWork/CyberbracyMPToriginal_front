import 'package:cyberbracy_mpt_original_front/domain/uses/sign_in.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/who_am_i.dart';
import 'package:cyberbracy_mpt_original_front/presentation/auth/sign_in/controller/sign_in_state.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignIn signIn;
  final WhoAmI _whoAmI;
  SignInCubit(
    this._whoAmI, {
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
        (data) async {
          emit(SignInLoadedState());
          sl.get<Dio>(instanceName: 'api_second').options.headers.addAll(
            {
              'Authorization': 'Bearer ${data.accessToken}',
            },
          );
          var response = await _whoAmI.call(WhoAmIParams());
          response.fold(
            (error) => emit(SignInErrorState(message: error.toString())),
            (data) => sl.registerSingleton(data),
          );
        },
      );
    } catch (e) {
      emit(SignInErrorState(message: e.toString()));
    }
  }
}
