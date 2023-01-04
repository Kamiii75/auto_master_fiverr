import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/default_button.dart';
import '../widgets/text_field.dart';

class AddVehicleService extends StatelessWidget {
  const AddVehicleService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(appBar: AppBar(
          backgroundColor: ConstColors.appBarColor,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('addService'.tr, style: ConstStyles.kTitleStyle,),
        ), body:
        SingleChildScrollView(
          child: Form(
            child: Padding(
              padding:  EdgeInsets.all(3.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: Image.asset('assets/images/logo.jpeg',height: 15.h,width: 100.w,),),

                  SizedBox(height: 5.h),
                  DefaultTextField(
                      type: 'name',
                      // onChange: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      // onSave: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      hint: 'dateVisit'.tr,
                      controller: provider.dateVisitController,
                      label: 'dateVisit'.tr,
                      textInputType:
                      TextInputType.datetime),
                  SizedBox(height: 3.h),
                  DefaultTextField(
                      type: 'name',
                      // onChange: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      // onSave: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      hint: 'mileage'.tr,
                      controller: provider.mileageController,
                      label: 'mileage'.tr,
                      textInputType:
                      TextInputType.number),
                  SizedBox(height: 3.h),
                  DefaultTextField(
                      type: 'name',
                      // onChange: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      // onSave: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      hint: 'workDescription'.tr,
                      controller: provider.workDescriptionController,
                      label: 'workDescription'.tr,
                      textInputType:
                      TextInputType.text),
                  SizedBox(height: 3.h),
                  DefaultTextField(
                      type: 'name',
                      // onChange: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      // onSave: (val) {
                      //   model.appUser.email =
                      //       emailController.text;
                      // },
                      hint: 'observations'.tr,
                      controller: provider.observationsController,
                      label: 'observations'.tr,
                      textInputType:
                      TextInputType.text),
                  SizedBox(height: 3.h),
                  DefaultButton(onTap: () => provider.validateCarServices(context), txt: 'save'.tr,)
                ],),
            ),
          ),
        )
          ,);
      },
    );
  }
}
