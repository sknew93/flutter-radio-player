import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = false;
  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark: ThemeMode.light;
  }
  void switchTheme(){
    _isDark =! _isDark;
    notifyListeners();
  }
}


final ThemeData customThemeDataLight = new ThemeData(
    canvasColor: Color.fromRGBO(226, 91, 148, 1),
    textTheme: TextTheme(
        headline5: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black)
    ),
    iconTheme: IconThemeData(color: Colors.black),
    cardColor: Colors.white,
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    buttonColor: Colors.white,
    highlightColor: Color.fromRGBO(226, 91, 148, 1),
    colorScheme: ColorScheme.light(),
    scaffoldBackgroundColor: Color.fromRGBO(248, 249, 251, 1),
    brightness: Brightness.light);

final ThemeData customThemeDataDark = new ThemeData(
    canvasColor: Color.fromRGBO(226, 91, 148, 1),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.white),
    ),
    // cardColor: Colors.black26,
    iconTheme: IconThemeData(color: Colors.white),
    bottomAppBarColor: Colors.black,
    backgroundColor: Colors.black,
    buttonColor: Colors.black,
    highlightColor: Color.fromRGBO(226, 91, 148, 1),
    colorScheme: ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark);
