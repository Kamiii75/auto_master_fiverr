import 'package:auto_master_fiverr/core/constants/const_styles.dart';
import 'package:auto_master_fiverr/ui/screens/add_vehicle_service.dart';
import 'package:auto_master_fiverr/ui/screens/admin_screen.dart';
import 'package:auto_master_fiverr/ui/screens/change_password.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'add_vehicle.dart';
class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.only(top: 6.5.h),
        child: Drawer(
          backgroundColor: Colors.white,
child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
  DrawerHeader(child: Image.asset('assets/images/logo.jpeg')),
  SizedBox(height: 30.h,),

  ListTile(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdminScreen())),
        title: Text('Admin',style: ConstStyles.kBoldTextStyle,),
  ),
  ListTile(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangePassword())),
        title: Text('Change Password',style: ConstStyles.kBoldTextStyle,),
  ),

  ListTile(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddVehicle())),
        title: Text('Add Vehicles',style: ConstStyles.kBoldTextStyle,),
  ),
  ListTile(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddVehicleService())),
        title: Text('Add Vehicles Services',style: ConstStyles.kBoldTextStyle,),
  ),
  ListTile(
        title: Text('All Vehicles',style: ConstStyles.kBoldTextStyle,),
  ),
  ListTile(
        title: Text('Logout',style: ConstStyles.kBoldTextStyle,),
  ),

],),
        ),
      ),
    );
  }
}
