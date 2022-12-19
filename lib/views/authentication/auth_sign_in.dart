import 'package:covid_19/main.dart';
import 'package:covid_19/views/authentication/auth.dart';
import 'package:covid_19/views/authentication/forget_password.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationSignIn extends StatefulWidget {
  const AuthenticationSignIn({Key? key, required this.onClickedSignUp})
      : super(key: key);

  final VoidCallback onClickedSignUp;

  @override
  State<AuthenticationSignIn> createState() => _AuthenticationSignInState();
}

class _AuthenticationSignInState extends State<AuthenticationSignIn> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signinWithEmailAndPassword() async {
    final isvalid = formKey.currentState!.validate();
    if (!isvalid) return;
    try {
      await Auth().signinWithEmailAndPasswordFunction(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  // regular expression to check if string
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;

  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  //   1:   Great

  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();

    if (_password.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (_password.length < 8) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text("Welcome",
                        style: Theme.of(context).textTheme.headline3),
                  )),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
                                    : null,
                            controller: emailController,
                            style: Theme.of(context).textTheme.bodyText2,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.alternate_email_rounded),
                              hintText: "Email",
                              errorStyle:
                                  const TextStyle(color: Color(0xFF821D30)),
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Enter min. 6 characters '
                                    : null,
                            controller: passwordController,
                            style: Theme.of(context).textTheme.bodyText2,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                              hintText: "Password",
                              errorStyle:
                                  const TextStyle(color: Color(0xFF821D30)),
                              hintStyle: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              ListTile(
                trailing: TextButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ForgetPassword();
                          },
                        )),
                    style: TextButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      "Forget Password",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF821D30)),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: signinWithEmailAndPassword,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF821D30),
                    ),
                    child: Text(
                      "SIGN IN",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
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
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: const Color(0xFF05445E)),
                  Text(
                    "OR",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14.5, fontWeight: FontWeight.w700),
                  ),
                  Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: const Color(0xFF05445E))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Center(child: SignInButton(Buttons.Google, onPressed: () {})),
              const SizedBox(
                height: 10,
              ),
              Center(child: SignInButton(Buttons.Facebook, onPressed: () {})),
              const SizedBox(
                height: 60,
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF821D30)),
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
