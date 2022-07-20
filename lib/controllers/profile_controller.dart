import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  final _dio = Dio();

  final image = RxString('');
  final name = RxString('');
  final userName = RxString('');
  final email = RxString('');
  final phone = RxString('');

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = await jsonDecode(prefs.getString('userDetails') ?? '');


    try {
      if (data['data']['USER'] != null) {
        // image.value = data['data']['USER']['image'];
        name.value = data['data']['USER']['firstName'];
        userName.value = data['data']['USER']['userName'];
        email.value = data['data']['USER']['email'];
        phone.value = data['data']['USER']['mobileNumber'];
      } else {
        // image.value = data['data']['user']['image'];
        name.value = data['data']['user']['firstName'];
        userName.value = data['data']['user']['userName'];
        email.value = data['data']['user']['email'];
        phone.value = data['data']['user']['mobileNumber'];
      }
    } catch (e) {
  
    }
  }

  updateUserDetails(){

    





  }






}
