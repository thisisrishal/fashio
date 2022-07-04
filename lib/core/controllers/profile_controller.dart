import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final _dio = Dio();

  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = jsonDecode(prefs.getString('userDetails') ?? '');
    print(data);
    // print('data kitteeeeeeee');
    // print(data["data"].firstname);
    
  }
}
