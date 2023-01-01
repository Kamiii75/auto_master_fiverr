import 'package:auto_master_fiverr/ui/screens/show_vehicle_services.dart';
import 'package:flutter/material.dart';
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
              'Show All Vehicles',
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
          body: Padding(
            padding: EdgeInsets.all(1.h),
            child: ListView.builder(
              itemCount: provider.listVehicles.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                 BlocProvider.of<SystemBloc>(context)
                      .add(ChangeDocId(docid: provider.listVehicles[index].id));
                  await provider.getSingleVehicle(context,provider.listVehicles[index].id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShowVehicleServices()));
                },
                child: Container(
                  padding: EdgeInsets.all(.5.h),
                  margin: EdgeInsets.all(.5.h),
                  decoration: BoxDecoration(
                      color: ConstColors.kPrimaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'Vehicle Number',
                              val: provider.listVehicles[index].vehicleNumber,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'Maker',
                              val: provider.listVehicles[index].maker,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'Manufacture Year',
                              val: provider.listVehicles[index].manufactureYear,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'Model',
                              val: provider.listVehicles[index].model,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'Engine Number',
                              val: provider.listVehicles[index].engineNumber,
                            ),
                            SingleRow(
                              color: ConstColors.bgColor,
                              label: 'VIN',
                              val: provider.listVehicles[index].vin,
                            ),
                          ],
                        ),
                      ),
                      QrImage(
                        foregroundColor: Colors.black,
                        data: provider.listVehicles[index].id,
                        version: QrVersions.auto,
                        size: 30.w,
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
