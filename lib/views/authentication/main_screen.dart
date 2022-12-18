import 'package:covid_19/views/authentication/auth.dart';
import 'package:covid_19/views/authentication/auth_screen.dart';
import 'package:covid_19/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: Auth().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error",
                style: Theme.of(context).textTheme.headline2,
              ),
            );
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}
