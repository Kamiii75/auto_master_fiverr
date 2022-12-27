import 'package:auto_master_fiverr/ui/widgets/qrcode_dialogbox.dart';
import 'package:auto_master_fiverr/ui/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/constants/const_colors.dart';
import '../../core/models/vehicle_model.dart';
import '../../core/providers/main_provider.dart';
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
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: size.height * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  LargeText(
                    text: 'Add Vehicle',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
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
            buildSingleRow(size, 'Vehicle Number', mdl.vehicleNumber),
            buildSingleRow(size, 'Maker', mdl.maker),
            buildSingleRow(size, 'Manufacture Year', mdl.manufactureYear),
            buildSingleRow(size, 'Model', mdl.model),
            buildSingleRow(size, 'Engine Number', mdl.engineNumber),
            buildSingleRow(size, 'VIN', mdl.vinValue),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                    onTap: () {
                      Provider.of<MainProvider>(context, listen: false)
                          .addVehicle(mdl);

                      Navigator.of(context).pop();
                      showDialog(context: context, builder: (_){return QrCodeDialogBox(qr: mdl.id,);});
                    },
                    txt: 'Save'),
                DefaultButton(
                    onTap: () => Navigator.of(context).pop(), txt: 'Cancel'),

              ],
            ),
          ],
        ),
      ),
    );
  }

  buildSingleRow(Size size, String label, String val) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 40, vertical: size.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text: label),
          SmallText(text: val),
        ],
      ),
    );
  }
}
