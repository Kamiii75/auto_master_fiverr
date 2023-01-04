import 'package:auto_master_fiverr/core/constants/const_styles.dart';
import 'package:auto_master_fiverr/ui/screens/admin_screen.dart';
import 'package:auto_master_fiverr/ui/screens/change_password.dart';
import 'package:auto_master_fiverr/ui/screens/show_all_vehicles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/blocs/bloc_export.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemBloc, SystemState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 6.5.h),
            child: Drawer(
              backgroundColor: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DrawerHeader(child: Image.asset('assets/images/logo.jpeg')),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListTile(
                    onTap: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminScreen())),
                    title: Text(
                      'admin'.tr,
                      style: ConstStyles.kBoldTextStyle,
                    ),
                    leading: const Icon(Icons.account_circle,color: Colors.black,),
                  ),
                 state.isAdmin? ListTile(
                    onTap: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePassword())),
                    title: Text(
                      'changePassword'.tr,
                      style: ConstStyles.kBoldTextStyle,
                    ),
                   leading: const Icon(Icons.lock,color: Colors.black,),

                 ):Container(),
                  state.isAdmin?  ListTile(
                    onTap: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShowAllScreens())),
                    title: Text(
                      'allVehicles'.tr,
                      style: ConstStyles.kBoldTextStyle,
                    ),
                    leading: const Icon(Icons.car_crash_sharp,color: Colors.black,),

                  ):Container(),
                  state.isAdmin?  ListTile(
                    onTap: ()=>BlocProvider.of<SystemBloc>(context)
                        .add(const ChangeAdmin(admin: false)),
                    title: Text(


                      'logout'.tr,
                      style: ConstStyles.kBoldTextStyle,
                    ),
                    leading: const Icon(Icons.logout,color: Colors.black,),

                  ):Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
