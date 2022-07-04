// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fashio/configs/appConstants.dart';
import 'package:fashio/core/models/product_details_model.dart';
import 'package:fashio/core/services/AppServices.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SingleProductController extends GetxController {
  @override
  void onInit() {
    fetchProductDetails();
    super.onInit();
  }

  dynamic productDetails = Rx<Product>;

  RxString id = ''.obs;

  final RxBool _isLoading = true.obs;

  final selectedColor = Colors.transparent.obs;



  // dynamic sizeList = Rx<List<String>>  ;

  // final productDetails = Rx<List<Product>>([]);

  fetchProductDetails() async {
    var response =
        await getDataResponse('/single-product-data/62b44f379020fa6608b380ab');

    // print(response);
    // var jsonResponse = json.decode(response);
    // final
    // Color color = colorFromHex(response['color']);

    // final Color color = Color(color: response['red']);
    // print('color: ${color.}');

    // MaterialColor color = Colors.red;
    // var hexCode = '#${color.value.toRadixString(16)}';
    // print('hexCode: $hexCode');

    final productModel = ProductDetailsModel.fromJson(response);
    // final sizeList = List<String>.generate(productModel.product!.size!.length,
    // (i) => productModel.product!.size![i].size.toString());
    // print(items);
    // print(productModel.product!.size![2].size);

    productDetails = productModel.product;

    // productDetails.value = productModel.product as List<Product>;

    // print('-----------${productModel}');
    // // var plist = productModel.product;

    // productDetails.value = plist ;

    try {} catch (e) {
      throw e.toString();
    }
  }
}
