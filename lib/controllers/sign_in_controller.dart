import 'dart:convert';

// import 'package:fashio/configs/appConfig.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/shared/components/texts.dart';
// import 'package:fashio/ui/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSignInController extends GetxController {
  final _dio = Dio();

  final email = RxString('');
  final password = RxString('');
  final firstName = RxString('');
  final lastName = RxString('');
  final mobileNumber = RxString('');
  final Otp = RxString('');

  final gotOtp = RxString('');

  login(
    BuildContext context,
  ) async {
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
        prefs.setString('userDetails', jsonEncode(res.data));
        print(prefs.getString('UserDetails'));

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

  requestOTP(BuildContext context) async {
    final data = {
      'mobileNumber': mobileNumber.value,
    };
    try {
      final res = await _dio.post('$baseUrl/login-otp', data: data);
      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'OTP sent successfully',
          backgroundColor: AppColor.blueGrey,
          colorText: AppColor.kWhite,
        );
        return res.data;
      }
    } catch (e) {
      if (e is DioError) {
        // print(e.message);
        return ScaffoldMessenger.of(context).showSnackBar(
            errorSnackbar(e.response!.data['message'].toString()));
      }
      // print(e.toString());
    }
  }

  verifyOtp(BuildContext context) async {
    final data = {
      "mobilenumber": mobileNumber.value,
      "otp": Otp.value,
    };
    try {
      final res = await _dio.post('$baseUrl/login-verify-otp', data: data);
      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Login  successfully',
          backgroundColor: AppColor.blueGrey,
          colorText: AppColor.kWhite,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        prefs.setString('userDetails', jsonEncode(res.data));
        Get.toNamed('/');

        return res.data;
      }
    } catch (e) {
      if (e is DioError) {
        // print(e.message);
        return ScaffoldMessenger.of(context).showSnackBar(
            errorSnackbar(e.response!.data['message'].toString()));
      }
      // print(e.toString());
    }
  }

  register(BuildContext context) async {
    final data = {
      "firstName": firstName.value,
      "lastName": lastName.value,
      "email": email.value,
      "password": password.value,
      "mobileNumber": int.parse(mobileNumber.value)
    };
    try {
      final res = await _dio.post('$baseUrl/signup', data: data);

      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Registration Success ${res.data}',
          backgroundColor: AppColor.blueGrey,
          colorText: AppColor.kWhite,
        );

        // print(res.data);
        // print('User Registration success ');
        Get.toNamed('/mlogin');

        return res.data;
      } else {
        Get.snackbar(
          'Failed',
          'Failed to Registration',
        );
      }
    } catch (e) {
      if (e is DioError) {
        return ScaffoldMessenger.of(context).showSnackBar(
            errorSnackbar(e.response!.data['message'].toString()));
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(errorSnackbar(e));
      }
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    Get.offAndToNamed('elogin');
  }

  SnackBar errorSnackbar(error) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: HeadTitle(
        text: error,
        color: Colors.white,
        // maxLines: 5,
      ),
    );
  }
}
