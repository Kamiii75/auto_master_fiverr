import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/const_colors.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: ConstColors.kPrimaryColor.withOpacity(.05)),
      gapPadding: 10,
    );
  }

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 3.w,
      vertical: 2.h,
    ),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
      // bodyText1: TextStyle(color: kTextColor),
      // bodyText2: TextStyle(color: kTextColor),
      );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    // textTheme: TextTheme(
    //   headline6: TextStyle(color: Color(0xFF8B888B), fontSize: 18),
    // ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
