import 'package:auto_master_fiverr/core/models/services_model.dart';
import 'package:auto_master_fiverr/ui/widgets/qrcode_dialogbox.dart';
import 'package:auto_master_fiverr/ui/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/models/vehicle_model.dart';
import '../../core/providers/main_provider.dart';
import '../screens/home_screen.dart';
import 'build_single_row.dart';
import 'default_button.dart';
import 'large_text.dart';


class AddServiceDialogBox extends StatelessWidget {
  final ModelService mdl;

  const AddServiceDialogBox({Key? key, required this.mdl}) : super(key: key);

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
                children: const [
                  LargeText(
                    text: 'Add Vehicle Service',
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
            SingleRow(label: 'Date Visit',val: mdl.dateVisit,),
            SingleRow(label: 'Mileage',val: mdl.mileage,),
            SingleRow(label: 'Work Description',val: mdl.workDescription,),
            SingleRow(label: 'Observations',val: mdl.observations,),

            SizedBox(height: 5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                  ww: 30.w,
                    onTap: () {
                      Provider.of<MainProvider>(context, listen: false)
                          .addVehicleService(context,mdl);
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    txt: 'Save'),
                DefaultButton(
                    ww: 30.w,
                    onTap: () => Navigator.of(context).pop(), txt: 'Cancel'),

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
