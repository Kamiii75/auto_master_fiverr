import 'package:flutter/material.dart';
class MainProvider extends ChangeNotifier{

  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
final TextEditingController _adminUserNameController=TextEditingController();
final TextEditingController _adminPasswordController=TextEditingController();
 TextEditingController get adminUserNameController=>_adminUserNameController;
  TextEditingController get adminPasswordController=>_adminPasswordController;


}