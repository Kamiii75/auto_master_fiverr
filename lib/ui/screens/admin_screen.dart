import 'package:auto_master_fiverr/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/text_field.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

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
          title: Text('admin'.tr, style: ConstStyles.kTitleStyle,),
        ), body:
        SingleChildScrollView(
          child: Form(
            child: Padding(
              padding:  EdgeInsets.all(3.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Center(child: Image.asset('assets/images/logo.jpeg'),),

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
                    hint: 'enterUserName'.tr,
                    controller: provider.adminUserNameController,
                    label: 'userName'.tr,
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
                    hint: 'enterUserPass'.tr,
                    isPass: true,
                    controller: provider.adminPasswordController,
                    label: 'userPass'.tr,
                    textInputType: TextInputType.name),

                  SizedBox(height: 3.h),
                  DefaultButton(onTap: () =>provider.login(context), txt: 'login'.tr,)
              ],),
            ),
          ),
        )
          ,);
      },
    );
  }
}
