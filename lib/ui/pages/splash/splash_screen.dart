import 'package:fashio/ui/pages/login/login.dart';
import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

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
      backgroundColor: AppColor.kDarkBlue,
      body: Logo2(),
    );
  }

  Future<void> gotoLogin() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off( LoginScreen());
    });
  }
}

class Logo2 extends StatelessWidget {
  const Logo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/images/logo2.png',
      height: 72.sp,
      width: 72.sp,
    ));
  }
}
