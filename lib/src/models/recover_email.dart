import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class RecoverEmail {
  final String email;

  RecoverEmail({
    @required this.email,
  });

  @override
  String toString() {
    return '$runtimeType($email)';
  }

  bool operator ==(Object other) {
    if (other is RecoverEmail) {
      return username == other.username && password == other.password;
    }
    return false;
  }

  int get hashCode => hash2(username, password);
}
