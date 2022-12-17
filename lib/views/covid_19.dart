import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_19/model/covid_19_dummy_data.dart';
import 'package:covid_19/widget/cached_network_image_custom.dart';
import 'package:covid_19/widget/top_of_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
                title: "Covid 19",
                onClick: Navigator.of(context).pop),
            Text(
              Covid19Dummy.covid19Title,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            CachedNetworkImageCustom(
                imageUrl:
                    "https://ichef.bbci.co.uk/news/976/cpsprodpb/1B58/production/_117500070_9db48266-1bb0-40c4-9c75-b6d2b06c30be.jpg"),
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
            CachedNetworkImageCustom(
                imageUrl:
                    "https://tse2.mm.bing.net/th?id=OIP.-MjeoTiaQAvZQHVTzkOazAHaE8&pid=Api&P=0"),
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
            CachedNetworkImageCustom(
                imageUrl:
                    "https://ichef.bbci.co.uk/news/1632/idt2/idt2/016656d2-a929-413a-a4df-19e6bfa3cd10/image/816"),
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
