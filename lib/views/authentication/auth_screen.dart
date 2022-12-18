import 'package:covid_19/views/authentication/sign_in.dart';
import 'package:covid_19/views/authentication/sign_up.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignin = true;

  @override
  Widget build(BuildContext context) {
    void toggle() {
      setState(() {
        isSignin = !isSignin;
      });
    }

    return isSignin
        ? SignIn(onClickedSignUp: toggle)
        : SignUp(
            onClickSignIn: toggle,
          );
  }
}
