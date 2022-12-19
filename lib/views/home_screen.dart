import 'package:covid_19/model/country_dummy_data.dart';
import 'package:covid_19/model/covid_model.dart';
import 'package:covid_19/service/covid_service.dart';
import 'package:covid_19/views/authentication/auth.dart';
import 'package:covid_19/views/covid_19.dart';
import 'package:covid_19/views/detail_country_info.dart';
import 'package:covid_19/views/rate_us.dart';
import 'package:covid_19/widget/drawer_item.dart';
import 'package:covid_19/widget/top_of_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  CovidService covidService = CovidService();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(children: [
            /////////////////////////////////////////////////
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF05445E),
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 85,
                        width: 85,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFD4F1F4),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_box_rounded,
                            color: Color(0xFF05445E),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmad Shakir",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 18, color: const Color(0xFFD4F1F4)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        Auth().currentUser!.email.toString(),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14, color: const Color(0xFFD4F1F4)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ////////////////////////////////////////////////
            DrawerItem(
                icon: Icons.sick_outlined,
                text: "Covid_19",
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Covid19(),
                  ));
                }),
            DrawerItem(
                icon: Icons.star_border_rounded,
                text: "Rate Us",
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RateUs(),
                  ));
                }),
            DrawerItem(
                icon: Icons.logout_rounded,
                text: "Logout",
                onClick: () {
                  Auth().signoutFunction();
                }),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 100,
                child: TopOfScreen(
                  iconData: Icons.menu_rounded,
                  title: "Home",
                  onClick: () => scaffoldKey.currentState!.openDrawer(),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<CovidModel>>(
                    future: covidService.fetchCovidData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString(),
                              style: Theme.of(context).textTheme.headline2),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: Text("No Data",
                              style: Theme.of(context).textTheme.headline2),
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
                                  // color: Color.fromARGB(255, 226, 247, 250),
                                  child: ListTile(
                                leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image(
                                      image:
                                          AssetImage(countryFlagList[index])),
                                ),
                                title: Text(snapshot.data![index].country!,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                trailing: Text(
                                    snapshot.data![index].infected.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline1),
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
      ),
    );
  }
}
