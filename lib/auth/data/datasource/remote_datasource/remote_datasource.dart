import 'package:cyberbracy_mpt_original_front/auth/data/models/sign_in_model.dart';
import 'package:cyberbracy_mpt_original_front/auth/data/models/sign_up_model.dart';

abstract class SignInRemoteDatasource {
  Future<SignInModel> signIn({required String email, required String password});
  Future<SignUpModel> signUp({
    required String email,
    required String fisrtName,
    required String lastName,
    required String phoneNumber,
    required String password,
  });
   Future<void>verification({required String code, required int id});
}
