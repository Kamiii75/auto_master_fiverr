import 'package:auto_master_fiverr/core/constants/const_colors.dart';
import 'package:auto_master_fiverr/core/constants/const_styles.dart';
import 'package:auto_master_fiverr/ui/screens/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/main_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          key: provider.homeScaffoldKey,
          appBar: AppBar(
            backgroundColor: ConstColors.appBarColor,
            leading: GestureDetector(
              onTap: () {

                if(provider.homeScaffoldKey.currentState!.isDrawerOpen){
                  provider.homeScaffoldKey.currentState!.closeDrawer();
                }{
                  provider.homeScaffoldKey.currentState!.openDrawer();

                }
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text('Auto Master', style: ConstStyles.kTitleStyle,),
          ),

          drawer: const DrawerScreen(),
        );
      },
    );
  }
}
