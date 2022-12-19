import 'package:covid_19/views/authentication/auth.dart';
import 'package:covid_19/widget/top_of_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailForForgetPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailForForgetPasswordController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    try {
      await Auth()
          .resetPassword(email: emailForForgetPasswordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 35,
                          color: Color(0xFF05445E),
                        )),
                    const SizedBox(
                      width: 65,
                    ),
                    Text("Forget Password",
                        style: Theme.of(context).textTheme.headline1),
                  ],
                ),
                const SizedBox(
                  height: 175,
                ),
                Text(
                  "Enter your email then click at reset password then change your password",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                        controller: emailForForgetPasswordController,
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
                ),
                const SizedBox(
                  height: 75,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: resetPassword,
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF821D30)),
                      child: Text(
                        "Reset Password",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white),
                      )),
                ),
              ])))),
    );
  }
}
