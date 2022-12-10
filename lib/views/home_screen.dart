import 'package:covid_19/model/covid_model.dart';
import 'package:covid_19/service/covid_service.dart';
import 'package:covid_19/widget/custom_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  CovidService covidService = CovidService();

  List countryFlagList = [
    Image.asset("assets/images/algeria.png"),
    Image.asset("assets/images/austria.png"),
    Image.asset("assets/images/azerbaijan.png"),
    Image.asset("assets/images/bahrain.png"),
    Image.asset("assets/images/belgium.png"),
    Image.asset("assets/images/brazil.png"),
    Image.asset("assets/images/bulgaria.png"),
    Image.asset("assets/images/canada.png"),
    Image.asset("assets/images/china.png"),
    Image.asset("assets/images/czech-republic.png"),
    Image.asset("assets/images/denmark.png"),
    Image.asset("assets/images/england.png"),
    Image.asset("assets/images/finland.png"),
    Image.asset("assets/images/france.png"),
    Image.asset("assets/images/germany.png"),
    Image.asset("assets/images/honduras.png"),
    Image.asset("assets/images/india.png"),
    Image.asset("assets/images/iran.png"),
    Image.asset("assets/images/italy.png"),
    Image.asset("assets/images/japan.png"),
    Image.asset("assets/images/luxembourg.png"),
    Image.asset("assets/images/malaysia.png"),
    Image.asset("assets/images/netherlands.png"),
    Image.asset("assets/images/nigeria.png"),
    Image.asset("assets/images/norway.png"),
    Image.asset("assets/images/pakistan.png"),
    Image.asset("assets/images/palestine.png"),
    Image.asset("assets/images/philippines.png"),
    Image.asset("assets/images/poland.png"),
    Image.asset("assets/images/portugal.png"),
    Image.asset("assets/images/romania.png"),
    Image.asset("assets/images/russia.png"),
    Image.asset("assets/images/saudi-arabia.png"),
    Image.asset("assets/images/serbia.png"),
    Image.asset("assets/images/singapore.png"),
    Image.asset("assets/images/slovakia.png"),
    Image.asset("assets/images/slovenia.png"),
    Image.asset("assets/images/south-korea.png"),
    Image.asset("assets/images/spain.png"),
    Image.asset("assets/images/sweden.png"),
    Image.asset("assets/images/switzerland.png"),
    Image.asset("assets/images/turkey.png"),
    Image.asset("assets/images/united-states.png"),
    Image.asset("assets/images/vietnam.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COVID 19"),
      ),
      body: FutureBuilder<List<CovidModel>>(
          future: covidService.fetchCovidData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(
                child: Text("No Data"),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 75,
                  child: Card(
                      child: ListTile(
                    leading: Container(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          "assets/images/${countryFlagList.map((e) => e)}.png",
                          // countryFlagList.map((e) => e).toString(),
                          fit: BoxFit.fill,
                        )),
                    title: Text(snapshot.data![index].country!),
                    trailing: Text(snapshot.data![index].infected.toString()),
                  )),
                );

                // return CustomContainer(
                //   countryFlagList: countryFlagList,
                //   title: snapshot.data![index].country!,
                //   infected: snapshot.data![index].infected.toString(),
                // );
              },
            );
          }),
    );
  }
}
