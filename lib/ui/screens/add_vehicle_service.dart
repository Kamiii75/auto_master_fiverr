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
        Form(
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
                    controller: provider.adminUserNameController,
                    label: 'Date Visit',
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
                    hint: 'Mileage',
                    controller: provider.adminUserNameController,
                    label: 'Mileage',
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
                    hint: 'Work Description',
                    controller: provider.adminUserNameController,
                    label: 'Work Description',
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
                    hint: 'Observations',
                    controller: provider.adminUserNameController,
                    label: 'Observations',
                    textInputType:
                    TextInputType.emailAddress),
                SizedBox(height: 3.h),
                DefaultButton(onTap: () {  }, txt: 'Save',)
              ],),
          ),
        )
          ,);
      },
    );
  }
}
