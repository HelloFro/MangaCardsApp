import 'package:flutter/material.dart';

import 'package:flutter_login/flutter_login.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "Manga Cards App",
      onSignup: null, 
      onLogin: null, 
      onRecoverPassword: null
    );
  }
}