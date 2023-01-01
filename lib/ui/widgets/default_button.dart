import 'package:flutter/material.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';

class DefaultButton extends StatelessWidget {
  final Function() onTap;
  final double clr;
  final double hh;
  final double ww;
  final String txt;

  const DefaultButton(
      {Key? key,
      required this.onTap,
      this.clr = 5,
      this.hh = 45,
      this.ww = 200,
      required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hh,
        width: ww,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const Offset(1, 2), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.circular(clr),
            color: ConstColors.btnColor),
        child: Center(
          child: Text(
            txt,
            style: ConstStyles.kButtonStyle,
          ),
        ),
      ),
    );
  }
}
