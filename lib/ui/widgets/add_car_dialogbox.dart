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


class AddCarDialogBox extends StatelessWidget {
  final ModelVehicle mdl;

  const AddCarDialogBox({Key? key, required this.mdl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: ConstColors.bgColor,
      insetPadding:  EdgeInsets.all(5.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.w)), //this right here
      child: SizedBox(
        height: size.height /2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  LargeText(
                    text: 'addVehicle'.tr,
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.h,),
            /*Container(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: const SmallText(text: 'Picture')),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 10),
              child: Container(
                color: const Color(0xff383d4d),
                height: size.height * 0.27,
                width: size.width * 0.7,
                // child: Image.file(
                //   file!,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),*/
            SingleRow(label: 'vehicleNumber'.tr,val: mdl.vehicleNumber,),
            SingleRow(label: 'maker'.tr,val: mdl.maker,),
            SingleRow(label: 'manufactureYear'.tr,val: mdl.manufactureYear,),
            SingleRow(label: 'model'.tr,val: mdl.model,),
            SingleRow(label: 'engineNumber'.tr,val: mdl.engineNumber,),
            SingleRow(label: 'vin'.tr,val:  mdl.vin,),

            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                  ww: 30.w,
                    onTap: () {
                      Provider.of<MainProvider>(context, listen: false)
                          .addVehicle(mdl);

                      Navigator.of(context).pop();
                      showDialog(context: context, builder: (_){return QrCodeDialogBox(qr: mdl.id,);});
                    },
                    txt: 'save'.tr),
                DefaultButton(
                  ww: 30.w,
                    onTap: () => Navigator.of(context).pop(), txt: 'cancel'.tr),

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
