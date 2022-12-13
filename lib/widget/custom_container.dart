import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Color color;
  String covidCase;
  dynamic infected;

  CustomContainer(
      {required this.color, required this.covidCase, this.infected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(covidCase),
          Text('$infected'),
        ],
      ),
    );
  }
}
