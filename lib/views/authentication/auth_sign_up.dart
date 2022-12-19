import 'package:covid_19/main.dart';
import 'package:covid_19/views/authentication/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthenticationSignUp extends StatefulWidget {
  const AuthenticationSignUp({Key? key, required this.onClickedSignIn})
      : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<AuthenticationSignUp> createState() => _AuthenticationSignUpState();
}

class _AuthenticationSignUpState extends State<AuthenticationSignUp> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final isvalid = formKey.currentState!.validate();
      if (!isvalid) return;
      await Auth().createUserWithEmailAndPasswordFunction(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "Create Your Account",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{5,}$');
                          if (value!.isEmpty) {
                            return ("Username cannot be Empty");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid name(Min. 5 Character)");
                          }
                          return null;
                        },
                        controller: userNameController,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Username",
                          errorStyle: const TextStyle(color: Color(0xFF821D30)),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                        controller: emailController,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.alternate_email_rounded),
                          hintText: "Email",
                          errorStyle: const TextStyle(color: Color(0xFF821D30)),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min. 6 characters '
                            : null,
                        controller: passwordController,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          hintText: "Password",
                          errorStyle: const TextStyle(color: Color(0xFF821D30)),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter min. 6 characters '
                            : null,
                        controller: confirmPasswordController,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          hintText: "Confirm Password",
                          errorStyle: const TextStyle(color: Color(0xFF821D30)),
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 40,
                child: ElevatedButton(
                  onPressed: createUserWithEmailAndPassword,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF821D30),
                  ),
                  child: Text(
                    "SIGN UP",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
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
              height: 30,
            ),
            Center(
                child: SignInButton(Buttons.Google,
                    text: "Sign up with Google", onPressed: () {})),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: SignInButton(Buttons.Facebook,
                    text: "Sign up with Facebook", onPressed: () {})),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: 'Already have an Account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                    TextSpan(
                      text: ' Sign in',
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF821D30)),
                    )
                  ])),
            ),
            const SizedBox(
              height: 20,
            ),
          ]))),
    );
  }
}
