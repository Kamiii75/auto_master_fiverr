import 'package:auto_master_fiverr/ui/widgets/small_text.dart';
import 'package:flutter/material.dart';

class SingleRow extends StatelessWidget {
  final String label;
  final String val;
  final Color color;

  const SingleRow(
      {Key? key,
      required this.label,
      required this.val,
      this.color = const Color(0xFFF3F3F3)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: size.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text: label,color: color,),
          SmallText(text: val,color: color,),
        ],
      ),
    );
  }
}
