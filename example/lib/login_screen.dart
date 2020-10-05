import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:super_login/super_login.dart';
import 'constants.dart';
import 'custom_route.dart';
import 'dashboard_screen.dart';
import 'users.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.username)) {
        return 'Username not exists';
      }
      if (mockUsers[data.username] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _signUp(SignUpData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String username) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(username)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SuperLogin(
      title: null,
      logo: 'assets/images/logo.png',
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      messages: LoginMessages(
        usernameHint: 'Username',
        fullNameHint: 'Nama Lengkap',
        passwordHint: 'Password',
        confirmPasswordHint: 'Ulangi Password',
        loginButton: 'LOGIN',
        signupButton: 'DAFTAR',
        forgotPasswordButton: 'Lupa Password?',
        recoverPasswordButton: 'Reset Password',
        goBackButton: 'KEMBALI',
        confirmPasswordError: 'Password tidak sama',
        recoverPasswordDescription: 'Konfirmasi password akan dikirim melalui email anda.',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.username}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (data) {
        print('Signup info');
        print('Name: ${data.username}');
        print('Name: ${data.fullname}');
        print('email: ${data.email}');
        print('Password: ${data.password}');
        return _signUp(data);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: (email) {
        print('Recover password info');
        print('Name: $email');
        return _recoverPassword(email);
        // Show new password dialog
      },
      showDebugButtons: true,
    );
  }
}
