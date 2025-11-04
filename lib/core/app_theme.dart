
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          headlineMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          )
        ),
      );