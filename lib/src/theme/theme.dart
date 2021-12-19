import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/src/helpers/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: cChineseWhite,
    scaffoldBackgroundColor: cChineseWhite,
    appBarTheme: const AppBarTheme(
      elevation: 5,
      backgroundColor: cWhiteSmoke,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhiteSmoke,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: cWhiteSmoke,
          systemNavigationBarIconBrightness: Brightness.dark),
      titleTextStyle:
          TextStyle(color: cCinder, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: cCinder),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colorInputLight,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: cWhiteSmoke,
      elevation: 5,
    ),
    iconTheme: const IconThemeData(color: cCinder),
    primaryTextTheme: const TextTheme(
        bodyText2: TextStyle(color: cCinder, fontSize: 14),
        headline6: TextStyle(color: cCinder),
        subtitle1: TextStyle(color: cCinder, fontSize: 14)),
    drawerTheme: const DrawerThemeData(
      backgroundColor: cWhiteSmoke,
      elevation: 15,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: cWhiteSmoke,
      elevation: 5,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(cGreenColor),
            elevation: MaterialStateProperty.all(5),
            foregroundColor: MaterialStateProperty.all(cWhiteSmoke))),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(cGreenColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cChineseWhite,
      selectedItemColor: cCinder.withOpacity(0.7),
      unselectedItemColor: cCinder.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: cCinder),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: cWoodsmoke,
    scaffoldBackgroundColor: cWoodsmoke,
    appBarTheme: const AppBarTheme(
      elevation: 5,
      backgroundColor: cCinder,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cCinder,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: cWoodsmoke,
          systemNavigationBarColor: cCinder,
          systemNavigationBarIconBrightness: Brightness.light),
      titleTextStyle: TextStyle(
          color: cWhiteSmoke, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: cWhiteSmoke),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: cCinder,
      elevation: 5,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorInputDark,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
    ),
    iconTheme: const IconThemeData(color: cWhiteSmoke),
    primaryTextTheme: const TextTheme(
      subtitle1: TextStyle(color: cCinder, fontSize: 14),
      subtitle2: TextStyle(color: cCinder, fontSize: 14),
      bodyText2: TextStyle(color: cCinder, fontSize: 14),
      headline6: TextStyle(color: cCinder, fontSize: 14),
      headline5: TextStyle(color: cCinder, fontSize: 14),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: cCinder,
      elevation: 15,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: cCinder,
      elevation: 5,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(cGreenColor),
            elevation: MaterialStateProperty.all(5),
            foregroundColor: MaterialStateProperty.all(cChineseWhite))),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(cGreenColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cWoodsmoke,
      selectedItemColor: Colors.white70,
      unselectedItemColor: cWhiteSmoke.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: cWhiteSmoke),
      showUnselectedLabels: true,
    ),
  );
}
