import 'package:fashio/ui/routes/routes.dart';
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
                  appBarTheme: Theme.of(context).appBarTheme.copyWith(
                        systemOverlayStyle: SystemUiOverlayStyle.dark,
                      ),
                  scaffoldBackgroundColor: Colors.white,
                  primarySwatch: Colors.blue,
                  fontFamily: 'poppins'),
              initialRoute: '/splash',
              getPages: Routes.routes,
            ));
  }
}
