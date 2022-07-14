import 'dart:convert';

import 'package:fashio/services/AppServices.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    fetchCartProducts();
    super.onInit();
  }

  var cartProducts = Rx<List<Cartdatum>>([]);

  String userId = '';
  String productId = '';
  String productImage = '';
  String price = '';
  String color = '';
  String size = '';

  fetchCartProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = await jsonDecode(prefs.getString('userDetails') ?? '');
    var id = await data['data']['USER'] == null
        ? data['data']['user']['_id']
        : data['data']['USER']['_id'] ?? '';

    try {
      var response = await getResponse('/user-cart-data/$id');

      final cartModel = cartModelFromJson(response);

      cartProducts.value = cartModel.data.cartdata;
    } catch (e) {
      throw Exception(e);
    }
  }

  bool isCartItem(String id) {
    return !cartProducts.value.any((element) => element.id == id);
  }

  addToCart() async{
    final data = {
      "userID": userId,
      "productID": productId,
      "productImage": productImage,
      "MRP": price,
      "color": color,
      "size": size
    };
    try {
      var response =
          await AppServices.addToCart(data);
      if (response['status'] == 'success') {
        Get.toNamed('/cart');
      }
    } catch (e) {
      print('yeah got another problem $e');
      throw Exception(e);
    }
  }
}
