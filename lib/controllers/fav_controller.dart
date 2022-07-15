import 'package:get/state_manager.dart';
import '../main.dart';
import '../models/Hive/fav_model.dart';
import '../view/constants/appConstants.dart';

class FavController extends GetxController {
  @override
  void onInit() {
    // getFav();
    super.onInit();
  }

  var favItems ;

  getFav() {
    favItems.value = favBox.values;
  }

  addToFav() {
    favBox.put(
        'check key',
        FavModel(
            productId: productDetailC.productDetails.id,
            img: productDetailC.productDetails.imgOne[0].url,
            title: productDetailC.productDetails.productname,
            price: productDetailC.productDetails.price,
            offerPrice: productDetailC.productDetails.offerPrice,
            offerPercent: productDetailC.productDetails.discount));
  }
}
