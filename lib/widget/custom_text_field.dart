import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  IconData iconData;
  String hintText;
  TextEditingController controller = TextEditingController();

  CustomTextfield(
      {required this.iconData,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 40,
        margin: const EdgeInsets.all(15),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2,
            prefixIcon: Icon(iconData, size: 20),
          ),
        ));
  }
}
