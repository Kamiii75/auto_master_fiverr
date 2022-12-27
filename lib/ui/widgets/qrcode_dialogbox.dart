import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/constants/const_colors.dart';
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
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  LargeText(
                    text: 'Qr Code',
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
            Center(
              child: QrImage(
                foregroundColor: Colors.white,
                data: qr,
                version: QrVersions.auto,
                size: 250.0,

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                  onTap: () => Navigator.of(context).pop(),
                  txt: 'OK',
                ),
                DefaultButton(
                  onTap: () => Navigator.of(context).pop(),
                  txt: 'Share',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
