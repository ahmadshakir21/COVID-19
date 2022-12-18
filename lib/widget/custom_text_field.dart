import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  IconData iconData;

  CustomTextfield({required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 40,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40)),
            prefixIcon: Icon(iconData, size: 20),
          ),
        ));
  }
}
