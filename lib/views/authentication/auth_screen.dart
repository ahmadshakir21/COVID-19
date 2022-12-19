import 'package:covid_19/views/authentication/auth_sign_in.dart';
import 'package:covid_19/views/authentication/auth_sign_up.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    void toggle() {
      setState(() {
        isSignIn = !isSignIn;
      });
    }

    return isSignIn
        ? AuthenticationSignIn(onClickedSignUp: toggle)
        : AuthenticationSignUp(
            onClickedSignIn: toggle,
          );
  }
}
