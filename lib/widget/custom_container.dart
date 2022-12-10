import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final List<Image> countryFlagList;
  final String title;
  final String infected;

  CustomContainer(
      {required this.countryFlagList,
      required this.title,
      required this.infected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 75,
      child: Card(
          child: ListTile(
        leading: Container(
            width: 50,
            height: 50,
            child: Image.asset(
              countryFlagList.map((e) => e).toString(),
              fit: BoxFit.fill,
            )),
        title: Text(title),
        trailing: Text(infected),
      )),
    );
    // Container(
    //   padding: const EdgeInsets.all(10),
    //   margin: const EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15),
    //     color: Colors.blueAccent,
    //   ),
    //   child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [Icon(icon), Text(title), Text(description)]),
    // );
  }
}
