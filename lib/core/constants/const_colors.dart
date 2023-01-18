import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstColors{
  static Color kPrimaryColor=const Color(0xffe25d37);

  static const Color kSecondaryColor = Color(0xFFF3F3F3);



  static const kTextColor = Color(0xff1c1c1c);
  static const kTextSecColor = Color(0xFFF3F3F3);
  static Color bgColor=const Color(0xFF2D2C2C);
  static Color btnColor=const Color(0xffeb883f);

  static const Color backColor=Color(0xFF000000);
  static const Color appBarColor=Color(0xFF2D2C2C);
  static const Color textfieldback=Color(0xFFF3F3F3);
  static const Color textfiled=Color(0xfff3f3f3);
  static const Color dialogBoxBackgroundColor = Color(0xffF5F5F5);
  static const LinearGradient primeryColor=LinearGradient( begin:  Alignment(0, -1),
    end:  Alignment(0, 1),
    colors:  <Color>[Color(0xffeb883f), Color(0xffe25d37)],
    stops:  <double>[0, 0.648],) ;


  static  BoxDecoration mainDecoration=BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.grey.shade100,
            Colors.blueGrey.shade100,
            Colors.grey.shade100,
            Colors.white,
          ]
      )
  ) ;


  static NeumorphicStyle neumorphicStyle =NeumorphicStyle(

    surfaceIntensity: 55,
  shadowDarkColor: Colors.blueGrey,
  shadowLightColor: Colors.grey.shade100,
  shadowDarkColorEmboss: Colors.blueGrey,
  shadowLightColorEmboss: Colors.grey.shade100,
  shape: NeumorphicShape.convex,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5.w)),
  depth: 8,
  lightSource: LightSource.topLeft,
  color: ConstColors.btnColor.withOpacity(.5)
  );
}