import 'package:flutter/material.dart';

class TopOfScreen extends StatelessWidget {
  IconData iconData;
  String title;
  VoidCallback onClick;

  TopOfScreen(
      {required this.iconData, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onClick,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    iconData,
                    size: 35,
                    color: const Color(0xFF05445E),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.275,
              ),
              Text(title, style: Theme.of(context).textTheme.headline1),
            ],
          ),
        ],
      ),
    );
  }
}
