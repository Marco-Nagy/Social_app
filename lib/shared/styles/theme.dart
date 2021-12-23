import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'fontSpring',
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.blue,
      size: 25,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 30.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.blue,
  ),
  primarySwatch: Colors.blue,
  primaryColor: Colors.grey.shade200,
  primaryTextTheme: TextTheme(
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('000000'),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('000000'),
    ),
    backgroundColor: HexColor('000000'),
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'fontSpring',
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 30.0,
    backgroundColor: HexColor('000000'),
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey.shade600,
  ),
  primaryColor: Colors.grey.shade700,
  primarySwatch: Colors.amber,
  primaryTextTheme: TextTheme(
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.amber,
    ),
  ),
);