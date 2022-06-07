import 'package:fashio/ui/pages/splash/splash_screen.dart';
import 'package:fashio/ui/shared/pages/navigatiton_bar/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
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
                primarySwatch: Colors.blue,
                fontFamily: 'poppins'
              ),
              home: MyNavigationBar()
              // SplashScreen(),
            ));
  }
}
