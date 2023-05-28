class SignUpEntity {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final TokensEntity tokens;
  final String code;
  final int id;

  SignUpEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.tokens,
    required this.code,
    required this.id,
  });
}

class TokensEntity {
  final String accessToken;
  final String refreshToken;

  TokensEntity({required this.accessToken, required this.refreshToken});
}
