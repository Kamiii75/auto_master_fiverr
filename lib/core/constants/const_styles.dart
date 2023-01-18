import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const_colors.dart';

class ConstStyles {
  static TextStyle kLargeStyle =  GoogleFonts.comfortaa(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle kButtonStyle =  GoogleFonts.comfortaa(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle kHeaderStyle =  GoogleFonts.comfortaa(
    color: ConstColors.backColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kTitleStyle =  GoogleFonts.comfortaa(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kSubTitleStyle =  GoogleFonts.comfortaa(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  ); static TextStyle kBoldTextStyle =  GoogleFonts.comfortaa(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );static TextStyle kNormalTextStyle =  GoogleFonts.comfortaa(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle kLabelTextStyle = GoogleFonts.comfortaa(
    fontSize: 16.sp,
    color: ConstColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
  );
}
