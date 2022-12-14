import 'package:covid_19/model/country_dummy_data.dart';
import 'package:covid_19/model/covid_model.dart';
import 'package:covid_19/service/covid_service.dart';
import 'package:covid_19/views/detail_country_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  CovidService covidService = CovidService();

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
            ),
            Expanded(
              child: FutureBuilder<List<CovidModel>>(
                  future: covidService.fetchCovidData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No Data"),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailCountryInfo(
                                country: snapshot.data![index].country!,
                                imageUrl: countryFlagList[index],
                                infected: snapshot.data![index].infected,
                                tested: snapshot.data![index].tested,
                                recovered: snapshot.data![index].recovered,
                                deceased: snapshot.data![index].deceased,
                                countryDummyDataVariable:
                                    countryDummyData[index],
                              ),
                            ));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 75,
                            child: Card(
                                child: ListTile(
                              leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image(
                                    image: AssetImage(countryFlagList[index])),
                              ),
                              title: Text(snapshot.data![index].country!),
                              trailing: Text(
                                  snapshot.data![index].infected.toString()),
                            )),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
