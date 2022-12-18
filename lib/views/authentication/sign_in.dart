import 'package:covid_19/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                        child: SizedBox(
                            height: 100, width: 100, child: Placeholder()))),
                const SizedBox(
                  height: 20,
                ),
                Text("Hello , sign in to your account",
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                  iconData: Icons.person,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 40,
                    margin: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(40)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(40)),
                          prefixIcon: const Icon(Icons.lock_rounded, size: 20),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye),
                            onPressed: () {},
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
