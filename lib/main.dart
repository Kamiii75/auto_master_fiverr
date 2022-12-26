import 'package:auto_master_fiverr/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/providers/main_provider.dart';
import 'core/utils/theme.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType){
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainProvider()),],
        child: MaterialApp(
            title: 'auto master',
            debugShowCheckedModeBanner: false,
            theme: theme(context),
            // home:const LoginScreen()
            home:const HomeScreen()
        ),
      );
    });

  }
}
