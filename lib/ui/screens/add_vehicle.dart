import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/default_button.dart';
import '../widgets/text_field.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({Key? key}) : super(key: key);

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
          title: Text('addVehicle'.tr, style: ConstStyles.kTitleStyle,),
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
                      hint: 'vehicleNumber'.tr,
                      controller: provider.vehicleNumberController,
                      label: 'vehicleNumber'.tr,
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
                      hint: 'maker'.tr,
                      controller: provider.makerController,
                      label: 'maker'.tr,
                      textInputType:
                      TextInputType.name),
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
                      hint: 'manufactureYear'.tr,
                      controller: provider.manufactureYearController,
                      label: 'manufactureYear'.tr,
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
                      hint: 'model'.tr,
                      controller: provider.modelController,
                      label: 'model'.tr,
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
                      hint: 'engineNumber'.tr,
                      controller: provider.engineController,
                      label: 'engineNumber'.tr,
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
                      hint: 'vin'.tr,
                      controller: provider.vinValueController,
                      label: 'vin'.tr,
                      textInputType:
                      TextInputType.text),
                  SizedBox(height: 3.h),
                  DefaultButton(onTap: () => provider.validateAddCar(context), txt: 'save'.tr,)
                ],),
            ),
          ),
        )
          ,);
      },
    );
  }
}
