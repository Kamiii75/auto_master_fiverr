import 'package:flutter/material.dart';
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
          title: Text('Add Vehicle', style: ConstStyles.kTitleStyle,),
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
                      hint: 'Vehicle Number',
                      controller: provider.vehicleNumberController,
                      label: 'Vehicle Number',
                      textInputType:
                      TextInputType.emailAddress),
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
                      hint: 'Maker',
                      controller: provider.makerController,
                      label: 'Maker',
                      textInputType:
                      TextInputType.emailAddress),
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
                      hint: 'Manufacture Year',
                      controller: provider.manufactureYearController,
                      label: 'Manufacture Year',
                      textInputType:
                      TextInputType.emailAddress),
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
                      hint: 'Model',
                      controller: provider.modelController,
                      label: 'Model',
                      textInputType:
                      TextInputType.emailAddress),
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
                      hint: 'Engine Number',
                      controller: provider.engineController,
                      label: 'Engine Number',
                      textInputType:
                      TextInputType.emailAddress),
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
                      hint: 'VIN',
                      controller: provider.adminUserNameController,
                      label: 'VIN',
                      textInputType:
                      TextInputType.emailAddress),
                  SizedBox(height: 3.h),
                  DefaultButton(onTap: () => provider.validateAddCar(context), txt: 'Save',)
                ],),
            ),
          ),
        )
          ,);
      },
    );
  }
}
