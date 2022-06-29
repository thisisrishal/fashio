import 'package:fashio/configs/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      
        builder: (context, orientation, deviceType) => GetMaterialApp(
          

              debugShowCheckedModeBanner: false,
              title: 'Fashio',
              theme: ThemeData(
                // appBarTheme: Theme.of(context).appBarTheme.copyWith(
                //       systemOverlayStyle: SystemUiOverlayStyle.dark,
                //     ),
                scaffoldBackgroundColor: AppColor.kWhite,
                fontFamily: 'poppins',
              ),
              initialRoute: '/splash',
              getPages: Routes.routes,
            ));
  }
}
