import 'package:flutter/material.dart';
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
          title: Text('Add Service', style: ConstStyles.kTitleStyle,),
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
                      hint: 'Date Visit',
                      controller: provider.dateVisitController,
                      label: 'Date Visit',
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
                      hint: 'Mileage',
                      controller: provider.mileageController,
                      label: 'Mileage',
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
                      hint: 'Work Description',
                      controller: provider.workDescriptionController,
                      label: 'Work Description',
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
                      hint: 'Observations',
                      controller: provider.observationsController,
                      label: 'Observations',
                      textInputType:
                      TextInputType.text),
                  SizedBox(height: 3.h),
                  DefaultButton(onTap: () => provider.validateCarServices(context), txt: 'Save',)
                ],),
            ),
          ),
        )
          ,);
      },
    );
  }
}
