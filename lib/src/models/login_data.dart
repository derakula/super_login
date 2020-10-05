import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class LoginData {
  final String username;
  final String email;
  final String password;

  LoginData({
    @required this.username,
    this.email,
    @required this.password,
  });

  @override
  String toString() {
    return '$runtimeType($username, $password)';
  }

  bool operator ==(Object other) {
    if (other is LoginData) {
      return username == other.username && password == other.password;
    }
    return false;
  }

  int get hashCode => hash2(username, password);
}
