import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../screens/home_screen.dart';
import 'default_button.dart';
import 'large_text.dart';

class QrCodeDialogBox extends StatelessWidget {
  final String qr;

  const QrCodeDialogBox({Key? key, required this.qr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: ConstColors.bgColor,
      insetPadding:  EdgeInsets.all(5.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.w)), //this right here
      child: SizedBox(
        height: size.height /1.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  LargeText(
                    text: 'qrCode'.tr,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: const Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.h),
            QrImage(
              foregroundColor: Colors.white,
              data: qr,
              version: QrVersions.auto,
              size: 60.w,

            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                  ww: 30.w,
                  onTap: () =>  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const HomeScreen()), (Route<dynamic> route) => false),
                  txt: 'ok'.tr,
                ),
                // DefaultButton(
                //   ww: 30.w,
                //   onTap: () {
                //
                //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                //     const HomeScreen()), (Route<dynamic> route) => false);
                //   },
                //   txt: 'share'.tr,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
