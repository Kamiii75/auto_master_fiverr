import 'dart:io';

import 'package:auto_master_fiverr/core/constants/const_colors.dart';
import 'package:auto_master_fiverr/core/constants/const_styles.dart';
import 'package:auto_master_fiverr/ui/screens/drawer_screen.dart';
import 'package:auto_master_fiverr/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/blocs/bloc_export.dart';
import '../../core/providers/main_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    qrController!.dispose();
    super.dispose();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      BlocProvider.of<SystemBloc>(context)
          .add(ChangeDocId(docid: scanData.code.toString()));
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
                }
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
              'Auto Master',
              style: ConstStyles.kTitleStyle,
            ),
          ),
          drawer: const DrawerScreen(),
          body: Stack(
            children: [
              Positioned(
                left: 5.h,
                right: 5.h,
                top: 5.h,
                child: provider.isScan
                    ? Container(
                        clipBehavior: Clip.antiAlias,
                        height: 50.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w)),
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                        ),
                      )
                    : Container(),
              ),
              Positioned(
                bottom: 10.h,
                left: 10.w,
                right: 10.w,
                child: DefaultButton(
                  onTap: () =>provider.setScan(true),
                  txt: 'Scan',
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
