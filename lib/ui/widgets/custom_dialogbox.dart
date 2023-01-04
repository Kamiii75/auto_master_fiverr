import 'package:auto_master_fiverr/ui/widgets/qrcode_dialogbox.dart';
import 'package:auto_master_fiverr/ui/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/models/vehicle_model.dart';
import '../../core/providers/main_provider.dart';
import 'build_single_row.dart';
import 'default_button.dart';
import 'large_text.dart';


class CustomDialogBox extends StatelessWidget {
  final String title;
  final String message;
  final Function() pressed;

  const CustomDialogBox({Key? key, required this.title, required this.message, required this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: ConstColors.bgColor,
      insetPadding:  EdgeInsets.all(3.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.w)), //this right here
      child: SizedBox(
        height: size.height /2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  LargeText(
                    text: title,
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: const Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.h,),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poiretOne(
                    textStyle: TextStyle(
                        color: ConstColors.kTextSecColor,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                    onTap: pressed,
                    txt: 'ok'.tr),

              ],
            ),
          ],
        ),
      ),
    );
  }

  // buildSingleRow(Size size, String label, String val) {
  //   return Padding(
  //     padding:
  //         EdgeInsets.symmetric(horizontal: 40, vertical: size.width * 0.01),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         SmallText(text: label),
  //         SmallText(text: val),
  //       ],
  //     ),
  //   );
  // }
}
