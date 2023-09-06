import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
        border: outlineInputBorder,
        errorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        suffixIconColor: Colors.grey,
        prefixIconColor: Colors.grey),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          disabledBackgroundColor: Colors.grey),
    ),
    primarySwatch: Colors.red,
    canvasColor: Colors.red,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black)));

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);
