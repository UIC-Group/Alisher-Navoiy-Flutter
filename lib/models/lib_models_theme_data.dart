import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier._privateConstructor();

  static final ThemeNotifier _instance = ThemeNotifier._privateConstructor();

  factory ThemeNotifier() {
    return _instance;
  }

  ThemeMode themeMode;

  identifyThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode = prefs.getInt('theme_id') != null
        ? prefs.getInt('theme_id') == 1
            ? ThemeMode.light
            : ThemeMode.dark
        : ThemeMode.light;

    notifyListeners();
  }

  getThemeMode() {
    // identifyThemeMode();
    return themeMode;
  }

  setThemeMode(ThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme_id', mode == ThemeMode.light ? 1 : 0);
    themeMode = mode;
    identifyThemeMode();
    notifyListeners();
  }

  notifyListeners();
}

class AppTheme {
  get darkTheme => ThemeData(
        disabledColor: Color(0xff292D36),
        bottomAppBarColor: Color(0xff212C3F),
        scaffoldBackgroundColor: Color(0xff1D212B),
        cardColor: Color(0xff313D4F),
        focusColor: Color(0xffFFFFFF),
        buttonColor: Color(0xff2C394E),
        errorColor: Color(0xffF6857D),
        splashColor: Color(0xff292D36),
        hoverColor: Colors.white.withOpacity(0.1),
        // primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Color(0xFF1D212B),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          bodyText2: TextStyle(color: Color(0xff96979C), fontFamily: 'Poppins'),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Color(0xff1D212B),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Color(0xff435269),
            fontFamily: 'Poppins',
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        brightness: Brightness.dark,
        canvasColor: Color(0xff1D212B),
        accentColor: Color(0xffF9D396),
        accentIconTheme: IconThemeData(
          color: Color(0xffF9D396),
        ),
      );

  get lightTheme => ThemeData(
        disabledColor: Color(0xffFBFBFB),
        hoverColor: Color(0xffFDF2E0),
        splashColor: Color(0xffF6F6F6),
        scaffoldBackgroundColor: Colors.white,
        focusColor: Color(0xff000000),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
          bodyText1: TextStyle(
            color: Color(0xff1D212B),
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            color: Color(0xffCACBCE),
            fontFamily: 'Poppins',
          ),
        ),
        bottomAppBarColor: Color(0xffffffff),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Color(0xff979797),
            fontFamily: 'OpenSans',
          ),
          labelStyle: TextStyle(
            color: Color(0xff848489),
            fontFamily: 'OpenSans',
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
        canvasColor: Colors.white,
        brightness: Brightness.light,
        accentColor: Color(0xffF9D396),
        accentIconTheme: IconThemeData(
          color: Color(0xff26E188),
        ),
      );
}
