import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class SignUpData {
  final String username;
  final String fullname;
  final String email;
  final String password;

  SignUpData({
    @required this.username,
    @required this.fullname,
    @required this.email,
    @required this.password,
  });

  @override
  String toString() {
    return '$runtimeType($username, $fullname, $email, $password)';
  }

  bool operator ==(Object other) {
    if (other is SignUpData) {
      return username == other.username && password == other.password;
    }
    return false;
  }

  int get hashCode => hash2(username, password);
}
