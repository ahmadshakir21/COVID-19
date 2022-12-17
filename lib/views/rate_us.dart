import 'package:covid_19/widget/top_of_screen.dart';
import 'package:flutter/material.dart';

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(10),
      child: TopOfScreen(
          iconData: Icons.arrow_back_rounded,
          title: "Rate Us",
          onClick: Navigator.of(context).pop),
    )));
  }
}
