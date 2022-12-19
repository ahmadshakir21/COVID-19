import 'package:covid_19/views/authentication/auth.dart';
import 'package:covid_19/views/authentication/auth_screen.dart';
import 'package:covid_19/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              color: Theme.of(context).progressIndicatorTheme.color,
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "Something went wrong",
              style: Theme.of(context).textTheme.headline2,
            ));
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
