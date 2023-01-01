import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/const_colors.dart';

class LargeText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overFlow;

  const LargeText(
      {Key? key,
      this.color = const Color(0xFFF3F3F3),
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: GoogleFonts.poiretOne(
        textStyle: TextStyle(
            color: color,
            fontSize: MediaQuery.of(context).size.width * 0.058,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
