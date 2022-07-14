// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../models/product_details_model.dart';

class SingleProductController extends GetxController {
  final CarouselController controller = CarouselController();

  dynamic productDetails = Rx<Product>;

  final RxInt current = 0.obs;
  final RxString selectedSize = ''.obs;
  final selectedColor = Colors.transparent.obs;

  Rx<bool> isCatVisible = false.obs;

  Future fetchProductDetails(String id) async {
    var response = await getDataResponse('/single-product-data/$id');
    final productModel = ProductDetailsModel.fromJson(response);
    productDetails = productModel.product;
    return productDetails;
  }

}
