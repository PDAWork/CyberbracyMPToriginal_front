import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_in_entiti.dart';

class SignInModel extends SignInEntiti {
  SignInModel({
    required super.refreshToken,
    required super.accessToken,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        refreshToken: json['refresh'] as String,
        accessToken: json['access'] as String,
      );
}
