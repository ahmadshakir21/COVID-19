import 'package:covid_19/main.dart';
import 'package:covid_19/views/authentication/auth.dart';
import 'package:covid_19/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignIn extends StatefulWidget {
  SignIn({required this.onClickedSignUp});

  final VoidCallback onClickedSignUp;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signinWithEmailAndPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await Auth().signinWithEmailAndPasswordFunction(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                  ),
                  Text("Hello , sign in to your account",
                      style: Theme.of(context).textTheme.headline1),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                    iconData: Icons.alternate_email_rounded,
                    hintText: "Email",
                    controller: emailController,
                  ),
                  CustomTextfield(
                      iconData: Icons.lock_rounded,
                      hintText: "Password",
                      controller: passwordController),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      margin: const EdgeInsets.only(top: 40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ElevatedButton(
                          onPressed: signinWithEmailAndPassword,
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF05445E),
                          ),
                          child: Text("SIGN IN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.grey,
                      ),
                      Text(
                        "OR",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "Sign in with : ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SignInButton(Buttons.Google, onPressed: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  SignInButton(Buttons.Facebook, onPressed: () {}),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                        )
                      ],
                    ),
                  ))
                ])))));
  }
}
