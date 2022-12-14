import 'package:covid_19/model/covid_model.dart';
import 'package:covid_19/service/covid_service.dart';
import 'package:covid_19/service/more_data_covid_service.dart';
import 'package:covid_19/widget/custom_container.dart';
import 'package:flutter/material.dart';

class DetailCountryInfo extends StatelessWidget {
  List countryFlagList = [
    "assets/images/algeria.png",
    "assets/images/austria.png",
    "assets/images/azerbaijan.png",
    "assets/images/bahrain.png",
    "assets/images/belgium.png",
    "assets/images/brazil.png",
    "assets/images/bulgaria.png",
    "assets/images/canada.png",
    "assets/images/china.png",
    "assets/images/czech-republic.png",
    "assets/images/denmark.png",
    "assets/images/finland.png",
    "assets/images/france.png",
    "assets/images/germany.png",
    "assets/images/honduras.png",
    "assets/images/hungary.png",
    "assets/images/india.png",
    "assets/images/iran.png",
    "assets/images/italy.png",
    "assets/images/japan.png",
    "assets/images/luxembourg.png",
    "assets/images/malaysia.png",
    "assets/images/netherlands.png",
    "assets/images/nigeria.png",
    "assets/images/norway.png",
    "assets/images/pakistan.png",
    "assets/images/palestine.png",
    "assets/images/philippines.png",
    "assets/images/poland.png",
    "assets/images/portugal.png",
    "assets/images/romania.png",
    "assets/images/russia.png",
    "assets/images/saudi-arabia.png",
    "assets/images/serbia.png",
    "assets/images/singapore.png",
    "assets/images/slovakia.png",
    "assets/images/slovenia.png",
    "assets/images/south-korea.png",
    "assets/images/spain.png",
    "assets/images/sweden.png",
    "assets/images/switzerland.png",
    "assets/images/turkey.png",
    "assets/images/england.png",
    "assets/images/united-states.png",
    "assets/images/vietnam.png",
  ];

  String imageUrl;
  String country;
  dynamic infected;
  dynamic tested;
  dynamic recovered;
  dynamic deceased;
  String? countryDummyDataVariable;

  DetailCountryInfo({
    required this.country,
    required this.imageUrl,
    required this.infected,
    this.tested,
    this.recovered,
    this.deceased,
    this.countryDummyDataVariable,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 200, child: Image.asset(imageUrl)),
                Center(child: Text(country)),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        color: Colors.pink,
                        covidCase: "Infected",
                        infected: '$infected'),
                    CustomContainer(
                        color: Colors.blueAccent,
                        covidCase: "Recovered",
                        infected: '$recovered'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        color: Colors.green,
                        covidCase: "Tested",
                        infected: '$tested'),
                    CustomContainer(
                        color: Colors.amber,
                        covidCase: "Deceased",
                        infected: '$deceased'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(child: Text(countryDummyDataVariable!)),
              ],
            ),
          )),
    ));
  }
}
