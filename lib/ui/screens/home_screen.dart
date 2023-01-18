import 'dart:io';

import 'package:auto_master_fiverr/core/constants/const_colors.dart';
import 'package:auto_master_fiverr/core/constants/const_styles.dart';
import 'package:auto_master_fiverr/ui/screens/drawer_screen.dart';
import 'package:auto_master_fiverr/ui/screens/show_vehicle_services.dart';
import 'package:auto_master_fiverr/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../core/blocs/bloc_export.dart';
import '../../core/providers/main_provider.dart';
import '../widgets/custom_dialogbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // qrController!.dispose();
    super.dispose();
  }

   GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // Barcode? result;
  String result = '';
  // QRViewController? qrController;

  // @overrid
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     qrController!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     qrController!.resumeCamera();
  //   }
  // }

  void _onQRViewCreated(QRViewController controller) {
    // qrController = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.dispose();
      BlocProvider.of<SystemBloc>(context,listen: false)
          .add(ChangeDocId(docid: scanData.code.toString()));
      await Provider.of<MainProvider>(context,listen: false).getSingleVehicle(context,scanData.code.toString());



      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ShowVehicleServices()));
      // Provider.of<MainProvider>(context,listen: false)
      // setState(() {
      //   result = scanData;
      // });
    });
  }

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
                if (provider.homeScaffoldKey.currentState!.isDrawerOpen) {
                  provider.homeScaffoldKey.currentState!.closeDrawer();
                }else
                {
                  provider.homeScaffoldKey.currentState!.openDrawer();
                }
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              'appTitle'.tr,
              style: ConstStyles.kTitleStyle,
            ),
          ),
          drawer: const DrawerScreen(),
          body: Container(
            decoration: ConstColors.mainDecoration,
            child: Stack(
              children: [

                Center(
                  child: Container(
                    width: 80.w,
                    height: 50.h,
                    child: NeumorphicButton(
                      onPressed: () async {

                        EasyLoading.show();
                        var res = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SimpleBarcodeScannerPage(),
                            ));
                        setState(() {
                          if (res is String) {
                            result = res ;
                            print('resultssssss');
                            print(result);
                          }
                        });
                        BlocProvider.of<SystemBloc>(context,listen: false)
                            .add(ChangeDocId(docid: result));
                        await Provider.of<MainProvider>(context,listen: false).getSingleVehicle(context,result).then((val){
                          if(val){


                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ShowVehicleServices()));

                          }else{
                            showDialog(
                                context: context,
                                builder: (context) {

                                  return CustomDialogBox(
                                    title: 'scanningFailed'.tr,
                                    message:'scanningFailedTxt'.tr,
                                    pressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                });
                          }


                          EasyLoading.dismiss();
                        });


                      },
                        style: ConstColors.neumorphicStyle,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('tabToScan'.tr,style: ConstStyles.kLargeStyle,),
                              Text('tabToScanTxt'.tr,textAlign:TextAlign.center,style: ConstStyles.kLabelTextStyle.copyWith(color: Colors.white),),
                              Image.asset('assets/images/qrcode.png'),

                            ],


                          ),
                        )
                    ),
                  ),
                ),
                // Positioned(
                //   left: 5.h,
                //   right: 5.h,
                //   top: 5.h,
                //   child: provider.isScan
                //       ? Container(
                //           clipBehavior: Clip.antiAlias,
                //           height: 50.h,
                //           width: 80.w,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5.w)),
                //           child: QRView(
                //             key: qrKey,
                //             onQRViewCreated: _onQRViewCreated,
                //           ),
                //         )
                //       : Container(),
                // ),
                // Positioned(
                //   bottom: 10.h,
                //   left: 10.w,
                //   right: 10.w,
                //   child: DefaultButton(
                //     // onTap: () =>provider.setScan(true),
                //     onTap: () async {
                //
                //       EasyLoading.show();
                //       var res = await Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const SimpleBarcodeScannerPage(),
                //           ));
                //       setState(() {
                //         if (res is String) {
                //           result = res ;
                //           print('resultssssss');
                //           print(result);
                //         }
                //       });
                //       BlocProvider.of<SystemBloc>(context,listen: false)
                //           .add(ChangeDocId(docid: result));
                //       await Provider.of<MainProvider>(context,listen: false).getSingleVehicle(context,result).then((val){
                //         if(val){
                //
                //
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const ShowVehicleServices()));
                //
                //         }else{
                //           showDialog(
                //               context: context,
                //               builder: (context) {
                //
                //                 return CustomDialogBox(
                //                   title: 'scanningFailed'.tr,
                //                   message:'scanningFailedTxt'.tr,
                //                   pressed: () {
                //                     Navigator.of(context).pop();
                //                   },
                //                 );
                //               });
                //         }
                //
                //
                //         EasyLoading.dismiss();
                //       });
                //
                //
                //     },
                //     txt: 'scan'.tr,
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
