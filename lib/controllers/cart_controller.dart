import 'dart:convert';

import 'package:fashio/services/AppServices.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    fetchCartProducts();
    getUserId();
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
    return cartProducts.value.any((element) => element.productId == id);
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDetails = prefs.getString('userDetails') ?? '';
    final data = await jsonDecode(userDetails);
    var id = await data['data']['USER'] == null
        ? data['data']['user']['_id']
        : data['data']['USER']['_id'] ?? '';
    userId = id;
  }

  addToCart() async {
    final datas = {
      "userID": userId,
      "productID": productId,
      "productImage": productImage,
      "MRP": price,
      "color": color,
      "size": size
    };

    var response = await AppServices.addToCart(datas);
    if (response != null) {
      await fetchCartProducts();
      Get.toNamed('/cart');
    }
  }

  removeCartItem(String id) async {
    final datas = {"userID": '62cd08b93132c44f9ef7d168', "productID": '62bd6e1d12db1861e6286dbf'};
    // print("$userId-----------$id------");

    var response = await AppServices.removeCartItem(datas);
    if (response != null) {
      await fetchCartProducts();
    }
  }
}
