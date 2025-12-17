class UserCredentials {
  final String login;
  final String password;

  UserCredentials({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
      };

  bool get isValidLogin => login.isNotEmpty;
  bool get isValidPassword => password.isNotEmpty && password.length >= 6;
}