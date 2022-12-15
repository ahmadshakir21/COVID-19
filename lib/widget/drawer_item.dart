import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String text;
  IconData icon;
  VoidCallback onClick;

  DrawerItem({required this.icon, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: Container(
          height: 70,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(0.0, 0.0), //(x,y)
              blurRadius: 6.0,
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(icon, size: 30, color: const Color(0xFF0B2E40)),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 17,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF05445E)),
                )
              ],
            ),
          ),
        ));
  }
}
