import 'dart:convert';

import 'package:fashio/models/coupon_model.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:get/state_manager.dart';

class CouponController extends GetxController {
  @override
  void onInit() {
    getCoupons;
    super.onInit();
  }

    var CouponDetails = Rx<List<CouponDatum>>([]);

  getCoupons() async {
    var response =await AppServices.getCoupons();

    CouponDetails.value = couponModelFromJson(jsonEncode(response)).data.couponData;
  }
}
