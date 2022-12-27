import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/const_colors.dart';
import '../../core/constants/const_styles.dart';

class ShowAllScreens extends StatelessWidget {
  const ShowAllScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.appBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Show All Vehicles',
          style: ConstStyles.kTitleStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.h),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Container(),
        ),
      ),
    );
  }
}
