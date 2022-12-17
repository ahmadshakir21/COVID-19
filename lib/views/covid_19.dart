import 'package:covid_19/model/covid_19_dummy_data.dart';
import 'package:covid_19/widget/top_of_screen.dart';
import 'package:flutter/material.dart';

class Covid19 extends StatelessWidget {
  const Covid19({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopOfScreen(
                iconData: Icons.arrow_back_rounded,
                title: "Covid_19",
                onClick: Navigator.of(context).pop),
            Text(
              Covid19Dummy.covid19Title,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(Covid19Dummy.covid19,
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 23,
            ),
            Text(
              Covid19Dummy.etymology,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(Covid19Dummy.etymologyDis,
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 23,
            ),
            Text(
              Covid19Dummy.deaths,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(Covid19Dummy.deathsDis,
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(
              height: 23,
            ),
          ],
        ),
      ),
    )));
  }
}
