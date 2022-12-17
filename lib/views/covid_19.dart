import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid_19/model/covid_19_dummy_data.dart';
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
            CachedNetworkImage(
              imageUrl:
                  'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
              imageBuilder: (context, imageProvider) => Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
