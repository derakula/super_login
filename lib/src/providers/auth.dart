import 'package:flutter/material.dart';

import '../models/signup_data.dart';
import '../models/login_data.dart';

enum AuthMode { Signup, Login }

/// The result is an error message, callback successes if message is null
typedef AuthLoginCallback = Future<String> Function(LoginData);
typedef AuthSignupCallback = Future<String> Function(SignUpData);

/// The result is an error message, callback successes if message is null
typedef RecoverCallback = Future<String> Function(String);

class Auth with ChangeNotifier {
  Auth({
    this.onLogin,
    this.onSignup,
    this.onRecoverPassword,
    String username = '',
    String fullname = '',
    String email = '',
    String password = '',
    String confirmPassword = '',
  })  : this._email = email,
        this._username = username,
        this._fullname = fullname,
        this._password = password,
        this._confirmPassword = confirmPassword;

  final AuthLoginCallback onLogin;
  final AuthSignupCallback onSignup;
  final RecoverCallback onRecoverPassword;

  AuthMode _mode = AuthMode.Login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.Login;
  bool get isSignup => _mode == AuthMode.Signup;
  bool isRecover = false;

  AuthMode opposite() {
    return _mode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
  }

  AuthMode switchAuth() {
    if (mode == AuthMode.Login) {
      mode = AuthMode.Signup;
    } else if (mode == AuthMode.Signup) {
      mode = AuthMode.Login;
    }
    return mode;
  }

  String _username = '';
  get username => _username;
  set username(String username) {
    _username = username;
    notifyListeners();
  }

  String _fullname = '';
  get fullname => _fullname;
  set fullname(String fullname) {
    _fullname = fullname;
    notifyListeners();
  }

  String _email = '';
  get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _confirmPassword = '';
  get confirmPassword => _confirmPassword;
  set confirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    notifyListeners();
  }
}
