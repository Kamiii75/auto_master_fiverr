import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/const_colors.dart';
class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;

  const SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //textAlign: TextAlign.justify,
      style: GoogleFonts.poiretOne(
        textStyle: TextStyle(
            color: ConstColors.ktextColor,
            fontSize: MediaQuery.of(context).size.width * 0.032,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}