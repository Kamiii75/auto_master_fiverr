import 'package:auto_master_fiverr/ui/screens/show_vehicle_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/blocs/bloc_export.dart';
import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/build_single_row.dart';
import 'add_vehicle.dart';

class ShowAllScreens extends StatelessWidget {
  const ShowAllScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ConstColors.appBarColor,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              'showAllVehicles'.tr,
              style: ConstStyles.kTitleStyle,
            ),
            actions: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:3.w),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddVehicle())),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: Container(
            decoration: ConstColors.mainDecoration,

            child: ListView.builder(
              itemCount: provider.listVehicles.length,
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.all(2.w),
                child: NeumorphicButton(
                  style: ConstColors.neumorphicStyle,

                  onPressed: () async {
                   BlocProvider.of<SystemBloc>(context)
                        .add(ChangeDocId(docid: provider.listVehicles[index].id));
                    await provider.getSingleVehicle(context,provider.listVehicles[index].id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShowVehicleServices()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 55.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'vehicleNumber'.tr,
                              val: provider.listVehicles[index].vehicleNumber,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'maker'.tr,
                              val: provider.listVehicles[index].maker,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'manufactureYear'.tr,
                              val: provider.listVehicles[index].manufactureYear,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'model'.tr,
                              val: provider.listVehicles[index].model,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'engineNumber'.tr,
                              val: provider.listVehicles[index].engineNumber,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'vin'.tr,
                              val: provider.listVehicles[index].vin,
                            ),
                          ],
                        ),
                      ),
                      QrImage(
                        foregroundColor: Colors.black,
                        data: provider.listVehicles[index].id,
                        version: QrVersions.auto,
                        size: 25.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
