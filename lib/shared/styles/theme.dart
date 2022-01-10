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
    bodyText2: TextStyle(
      fontSize:16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize:16,
      fontWeight: FontWeight.w600,
      color: Colors.red,
    ),
    subtitle2: TextStyle(
      fontSize:14,
      fontWeight: FontWeight.w400,
      color: Colors.red,
    ),
    button: TextStyle(
      fontSize:14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

  ),
  cardTheme: CardTheme(
    color: Colors.blue,
  ),
  cardColor: Colors.white,
  backgroundColor: Colors.white,
  focusColor: Colors.red,
  primarySwatch: Colors.red,
  primaryColor: Colors.red,
  canvasColor: Colors.white,
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
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize:16,
      fontWeight: FontWeight.w600,
      color: Colors.amber,
    ),
    subtitle2: TextStyle(
      fontSize:15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize:14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

  ),
  primaryTextTheme: TextTheme(
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.amber,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey.shade600,
  ),
  backgroundColor: Colors.black,
  focusColor: Colors.amber,
  primaryColor: Colors.amber,
  primarySwatch: Colors.amber,
  canvasColor: Colors.white60,

);