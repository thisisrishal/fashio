import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateUser();
    // gotoLogin();
    super.initState();
  }

  // Future<String> getValidationData() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var obtainedEmail = preferences.getString('email');
  //   return obtainedEmail?='';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: AppColor.kDarkBlue,
          systemOverlayStyle:
              customOverlayStyle(AppColor.kDarkBlue, Brightness.light)),
      backgroundColor: AppColor.kDarkBlue,
      body: const Logo2(),
    );
  }

  // Future<void> gotoLogin() async {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Get.toNamed('/elogin');
  //   });
  // }

  navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool("isLoggedIn") ?? false;
    Future.delayed(const Duration(seconds: 2), () {
      status ? Get.offAndToNamed('/') : Get.offAndToNamed('/elogin');
    });
  }
}
