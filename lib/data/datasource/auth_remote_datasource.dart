
import '../models/sign_in_model.dart';
import '../models/sign_up_model.dart';

abstract class AuthRemoteDatasource {
  Future<SignInModel> signIn({required String email, required String password});
  Future<SignUpModel> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
  });
   Future<void>verification({required String code, required int id});
}
