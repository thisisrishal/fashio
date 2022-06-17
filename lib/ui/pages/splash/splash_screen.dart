import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar:AppBar(
      //   backgroundColor: AppColor.kDarkBlue,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: AppColor.kDarkBlue,
      //     statusBarIconBrightness: Brightness.light,
      //   ),
      // ),
      backgroundColor: AppColor.kDarkBlue,
      body: Logo2(),
    );
  }

  Future<void> gotoLogin() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed('/login');
    });
  }
}
