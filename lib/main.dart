import 'package:fashio/ui/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fashio',
              theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  primarySwatch: Colors.blue,
                  fontFamily: 'poppins'),
              home: const SplashScreen(),
              // SplashScreen(),
            ));
  }
}
