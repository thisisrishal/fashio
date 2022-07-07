import 'package:fashio/core/models/cart_model.dart';
import 'package:fashio/core/services/AppServices.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    fetchCartProducts();
    super.onInit();
  }

  Rx<List<Cartdatum>> cartProducts = Rx<List<Cartdatum>>([]);

  fetchCartProducts() async {
    try {
      var response =
          await getResponse('/user-cart-data/62b0b522835d6481b69db9d8');

          //  print('++++++++++++++++++++++++++++++');

      // print(response);

      // print('_______________________________');
// 
      final cartModel = cartModelFromJson(response);

      cartProducts.value = cartModel.data.cartdata;

     

      // print(cartProducts.value.length);

    } catch (e) {
      // print('inside cath -------- ${e.toString()}');
    }
  }
}
