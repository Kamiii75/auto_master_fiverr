import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/default_button.dart';
import '../widgets/text_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

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
          title: Text('Admin Change Password', style: ConstStyles.kTitleStyle,),
        ), body:
        Form(
          child: Padding(
            padding:  EdgeInsets.all(3.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image.asset('assets/images/logo.jpeg',height: 20.h,width: 150.w,),),

                SizedBox(height: 15.h),
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
                    hint: 'Enter your Username',
                    controller: provider.adminUserNameController,
                    label: 'Username',
                    textInputType:
                    TextInputType.emailAddress),
                SizedBox(height: 3.h),
                DefaultTextField(
                    type: 'password',
                    // onChange: (val) {
                    //   model.appUser.password =
                    //       passwordController.text;
                    // },
                    // onSave: (val) {
                    //   model.appUser.password =
                    //       passwordController.text;
                    // },
                    hint: 'Enter your Old Password',
                    isPass: true,
                    controller: provider.adminPasswordController,
                    label: 'OLd Password',
                    textInputType: TextInputType.name),

                SizedBox(height: 3.h),
                DefaultTextField(
                    type: 'password',
                    // onChange: (val) {
                    //   model.appUser.password =
                    //       passwordController.text;
                    // },
                    // onSave: (val) {
                    //   model.appUser.password =
                    //       passwordController.text;
                    // },
                    hint: 'Enter your New Password',
                    isPass: true,
                    controller: provider.adminPasswordController,
                    label: 'New Password',
                    textInputType: TextInputType.name),

                SizedBox(height: 3.h),
                DefaultTextField(
                    type: 'password',
                    // onChange: (val) {
                    //   model.appUser.password =
                    //       passwordController.text;
                    // },
                    // onSave: (val) {
                    //   model.appUser.password =
                    //       passwordController.text;
                    // },
                    hint: 'Confirm your Password',
                    isPass: true,
                    controller: provider.adminPasswordController,
                    label: 'Confirm Password',
                    textInputType: TextInputType.name),

                SizedBox(height: 3.h),
                DefaultButton(onTap: () {  }, txt: 'Submit',)
              ],),
          ),
        )
          ,);
      },
    );
  }
}
