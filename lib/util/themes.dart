import 'package:flutter/material.dart';

class MinimalTheme {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'DMSans',
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange, accentColor: const Color.fromARGB(255, 255, 177, 59)),
      primaryColorDark: const Color.fromARGB(255, 239, 161, 34),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black, fontSize: 56.0, fontWeight: FontWeight.bold, letterSpacing: 4.0),
        headline2: TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold, letterSpacing: 4.0),
        headline3: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 2.0),
        headline4: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
        headline5: TextStyle(fontSize: 12.0, letterSpacing: 4.0, fontWeight: FontWeight.bold),
        button: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
    );
  }
}
