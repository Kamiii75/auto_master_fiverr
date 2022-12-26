import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const_colors.dart';

class ConstStyles {
  static TextStyle kButtonStyle =  GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kHeaderStyle =  GoogleFonts.quicksand(
    color: ConstColors.backColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kTitleStyle =  GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle kSubTitleStyle =  GoogleFonts.quicksand(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  ); static TextStyle kBoldTextStyle =  GoogleFonts.quicksand(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );static TextStyle kNormalTextStyle =  GoogleFonts.quicksand(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
}
