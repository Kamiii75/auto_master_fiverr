import 'package:auto_master_fiverr/ui/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/blocs/bloc_export.dart';
import 'core/providers/main_provider.dart';
import 'core/utils/localizatiion.dart';
import 'core/utils/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SystemBloc()),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MainProvider()),
          ],
          child: GetMaterialApp(
            translations: LocalizationClass(),
            locale: Locale("gr"),
            title: 'appTitle'.tr,
            debugShowCheckedModeBanner: false,
            theme: theme(context),
            // home:const LoginScreen()
            home: const HomeScreen(),

            builder: EasyLoading.init(),
            // builder: (context, child) {
            //   return MediaQuery(
            //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            //     child: child!,
            //   );
            // },
          ),
        ),
      );
    });
  }
}
