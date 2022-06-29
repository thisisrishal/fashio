import 'package:fashio/configs/appConfig.dart';
import 'package:fashio/configs/appConstants.dart';
import 'package:fashio/ui/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignInController extends GetxController {
  final _dio = Dio();

  final email = RxString('');
  final password = RxString('');

  login(
    BuildContext context,

    //  String email, String pass
  ) async {
    // print('${email.value},$password');
    // print('====================================');

    try {
      final res = await _dio.post(
        '$baseUrl/login-email',
        data: {
          // 'email': email.value,
          // 'password': password.value,
          'email': email.value,
          'password': password.value
        },
      );
      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Login Success  ${res.data}',
          backgroundColor: AppColor.blueGrey,
          colorText: AppColor.kWhite,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);

        // final SharedPreferences preferences =
        //     await SharedPreferences.getInstance();
        // preferences.setString('email', email.value);

        Get.toNamed('/');

        return res.data;
      } else {
        Get.snackbar('Failed', 'Failed to login');
      }
    } catch (e) {
      // print(e.toString());
      SnackBar snackbar = const SnackBar(
        backgroundColor: Colors.red,
        content: HeadTitle(
          text: 'Please give correct email and password',
          color: Colors.white,
          // maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
