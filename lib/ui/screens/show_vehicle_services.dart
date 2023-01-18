import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/blocs/bloc_export.dart';
import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/build_single_row.dart';
import 'add_vehicle_service.dart';

class ShowVehicleServices extends StatelessWidget {
  const ShowVehicleServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return BlocBuilder<SystemBloc, SystemState>(
          builder: (context, state) {
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
                actions: state.isAdmin
                    ? [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddVehicleService())),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]
                    : [],
                centerTitle: true,
                title: Text(
                  'vehicleServices'.tr,
                  style: ConstStyles.kTitleStyle,
                ),
              ),
              body: Container(
                decoration: ConstColors.mainDecoration,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            surfaceIntensity: 55,
                            shadowDarkColor: Colors.blueGrey,
                            shadowLightColor: Colors.grey.shade100,
                            shadowDarkColorEmboss: Colors.blueGrey,
                            shadowLightColorEmboss: Colors.grey.shade100,
                            shape: NeumorphicShape.convex,
                            // boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5.w)),
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.only(
                                bottomLeft: Radius.circular(5.w),
                                bottomRight: Radius.circular(5.w),
                              ),
                            ),
                            depth: 8,
                            lightSource: LightSource.topLeft,
                            color: ConstColors.bgColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 65.w,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SingleRow(
                                    color: ConstColors.kTextSecColor,
                                    label: 'vehicleNumber'.tr,
                                    val: provider.singleVehicle.vehicleNumber ??
                                        '',
                                  ),
                                  SingleRow(
                                    color: ConstColors.kTextSecColor,
                                    label: 'maker'.tr,
                                    val: provider.singleVehicle.maker ?? '',
                                  ),
                                  SingleRow(
                                    color: ConstColors.kTextSecColor,
                                    label: 'manufactureYear'.tr,
                                    val: provider
                                            .singleVehicle.manufactureYear ??
                                        '',
                                  ),
                                  SingleRow(
                                    color: ConstColors.kTextSecColor,
                                    label: 'model'.tr,
                                    val: provider.singleVehicle.model ?? '',
                                  ),
                                  SingleRow(
                                    color: ConstColors.kTextSecColor,
                                    label: 'engineNumber'.tr,
                                    val: provider.singleVehicle.engineNumber ??
                                        '',
                                  ),
                                  SingleRow(
                                    color: ConstColors.kTextSecColor,
                                    label: 'vin'.tr,
                                    val: provider.singleVehicle.vin ?? '',
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: QrImage(
                                foregroundColor: ConstColors.kTextSecColor,
                                data: provider.singleVehicle.id,
                                version: QrVersions.auto,
                                size: 30.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 65.h,
                      child: ListView.builder(
                        itemCount: provider.listService.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(2.w),
                          child: NeumorphicButton(
                            style: ConstColors.neumorphicStyle,
                            onPressed: () async {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleRow(
                                  color: ConstColors.bgColor,
                                  label: 'dateVisit'.tr,
                                  val: provider.listService[index].dateVisit,
                                ),
                                SingleRow(
                                  color: ConstColors.bgColor,
                                  label: 'mileage'.tr,
                                  val: provider.listService[index].mileage,
                                ),
                                SingleRow(
                                  color: ConstColors.bgColor,
                                  label: 'workDescription'.tr,
                                  val: provider
                                      .listService[index].workDescription,
                                ),
                                SingleRow(
                                  color: ConstColors.bgColor,
                                  label: 'observations'.tr,
                                  val: provider.listService[index].observations,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
