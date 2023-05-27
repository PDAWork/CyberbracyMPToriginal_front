import 'package:cyberbracy_mpt_original_front/auth/domian/entiti/sign_up_entiti.dart';

class SignUpModel extends SignUpEntiti {
  SignUpModel({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.password,
    required super.tokens,
    required super.code,
    required super.id,
  });
  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
        tokens: TokensModel.fromJson(json['tokens']),
        code: json['code'],
        id: json['id'],
      );
}

class TokensModel extends TokensEntiti {
  TokensModel({required super.accessToken, required super.refreshToken});
  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
        accessToken: json['access'],
        refreshToken: json['refresh'],
      );
}
