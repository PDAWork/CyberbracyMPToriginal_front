class SignUpEntiti {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final TokensEntiti tokens;
  final String code;
  final int id;

  SignUpEntiti({
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

class TokensEntiti {
  final String accessToken;
  final String refreshToken;

  TokensEntiti({required this.accessToken, required this.refreshToken});
}
