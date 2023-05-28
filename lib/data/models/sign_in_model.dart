
import '../../domain/entity/sign_in_entiti.dart';

class SignInModel extends SignInEntity {
  SignInModel({
    required super.refreshToken,
    required super.accessToken,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        refreshToken: json['refresh'] as String,
        accessToken: json['access'] as String,
      );
}
