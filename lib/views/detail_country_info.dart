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
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 40,
                                color: Color(0xFF05445E),
                              ),
                            ),
                          ),
                          Text("Detail",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 20)),
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFF05445E),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 175, child: Image.asset(imageUrl)),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                        color: const Color(0xFFE4B7A0),
                        covidCase: "Infected",
                        infected: '$infected'),
                    CustomContainer(
                        color: const Color(0xFF74BDCB),
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
                        color: const Color(0xFF3EB489),
                        covidCase: "Tested",
                        infected: '$tested'),
                    CustomContainer(
                        color: const Color(0xFFEF7C8E),
                        covidCase: "Deceased",
                        infected: '$deceased'),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  country,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    child: Text(
                  countryDummyDataVariable!,
                  style: Theme.of(context).textTheme.bodyText1,
                )),
              ],
            ),
          )),
    ));
  }
}
