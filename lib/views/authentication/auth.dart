import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;
  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  Future<void> signinWithEmailAndPasswordFunction(
      {required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPasswordFunction(
      {required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    try {} on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future signoutFunction() async {
    await firebaseAuth.signOut();
  }
}
