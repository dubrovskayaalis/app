import 'package:app/src/Model/user_credentials.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AuthorizationVm extends ChangeNotifier {
  AuthorizationVm();

  UserCredentials _credentials = UserCredentials(login: '', password: '');
  bool _passwordVisible = false;
  bool _isLoading = false;
  String? _loginError;
  String? _pwdError;

  UserCredentials get credentials => _credentials;
  bool get passwordVisible => _passwordVisible;
  bool get isLoading => _isLoading;
  String? get loginError => _loginError;
  String? get pwdError => _pwdError;

  void setLogin(String value) {
    _credentials = UserCredentials(
      login: value,
      password: _credentials.password,
    );
    notifyListeners();
  }

  void setPassword(String value) {
    _credentials = UserCredentials(login: _credentials.login, password: value);
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (!await _validateInputs()) return;
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed("/main");
      }
    } catch (e) {
      print("Error $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> _validateInputs() async {
    if (_credentials.login.isEmpty || _credentials.password.isEmpty) {
      if (_credentials.login.isEmpty) {
        _loginError = "Пожалуйста введите логин или почту";
        notifyListeners();
      }

      if (_credentials.password.isEmpty) {
        _pwdError = "Пожалуйста введите пароль";
        notifyListeners();
      }
      return false;
    }
    if (_credentials.login != "admin" || _credentials.password != "admin") {
      _loginError = "Неверный логин или пароль";
      notifyListeners();
      return false;
    }

    FlutterSecureStorage storage = FlutterSecureStorage();

    await storage.write(key: "user_auth", value: "True");

    return true;
  }

  static AuthorizationVm of(BuildContext context, {bool listen = true}) {
    return Provider.of<AuthorizationVm>(context, listen: listen);
  }
}
