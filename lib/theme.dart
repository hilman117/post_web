import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:post_web/const.dart';
import 'package:post_web/style.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'SF Pro Display',
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade200),
      cardColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: Colors.grey.shade50,
      canvasColor: Colors.black87,
      hoverColor: Colors.grey.shade200,
      scaffoldBackgroundColor: const Color(0xffE8EEF8),
      textTheme: TextTheme(
          displayLarge: style24SemiBold,
          displaySmall: style20Bold,
          displayMedium: style18Normal,
          bodyMedium: style18Bold,
          bodySmall: style18Normal),
      iconTheme: const IconThemeData(color: mainColor2),
      primaryColorLight: Colors.white);

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff192127)),
    fontFamily: 'SF Pro Display',
    brightness: Brightness.dark,
    canvasColor: const Color(0xffC7CED3),
    hoverColor: Colors.black45,
    cardColor: const Color(0xff0F1519),
    primaryColor: const Color(0xff192127),
    scaffoldBackgroundColor: const Color(0xff293237),
    textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.white),
        displaySmall: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xffC7CED3)),
        displayMedium: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
            color: const Color(0xffC7CED3)),
        bodyMedium: TextStyle(
            fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            fontSize: 18.sp,
            color: const Color(0xffC7CED3),
            fontWeight: FontWeight.normal)),
    iconTheme: const IconThemeData(color: Color(0xffC7CED3)),
  );
}
