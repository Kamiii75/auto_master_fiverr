import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const_colors.dart';

class ConstStyles {
  static TextStyle kButtonStyle =  GoogleFonts.poiretOne(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle kHeaderStyle =  GoogleFonts.poiretOne(
    color: ConstColors.backColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kTitleStyle =  GoogleFonts.poiretOne(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kSubTitleStyle =  GoogleFonts.poiretOne(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  ); static TextStyle kBoldTextStyle =  GoogleFonts.poiretOne(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );static TextStyle kNormalTextStyle =  GoogleFonts.poiretOne(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle kLabelTextStyle = GoogleFonts.poiretOne(
    fontSize: 16.sp,
    color: ConstColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
  );
}
