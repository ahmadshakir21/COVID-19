import 'package:covid_19/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.amiko().fontFamily,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF05445E)),
            headline2: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            headline3: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF05445E)),
            bodyText1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                wordSpacing: 2,
                color: Color(0xFF05445E)),
          )),
      home: HomeScreen(),
    );
  }
}
