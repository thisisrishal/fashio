import 'package:fashio/models/product_details_model.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:get/state_manager.dart';
import '../main.dart';
import '../models/Hive/fav_model.dart';

class FavController extends GetxController {
  @override
  void onInit() {
    getFav();
    super.onInit();
  }

  final favItems = [].obs;

  final isFav = false.obs;

  getFav() {
    favItems.value = favBox.values.toList();
  }

  isFavItem(String id) {
    isFav.value = favBox.containsKey(id);
  }

  addToFav(Product favItem) {
    final favModelValue = FavModel(
        productId: favItem.id,
        img: favItem.imgOne![0].url,
        title: favItem.productname,
        price: favItem.price,
        offerPrice: double.parse(favItem.offerPrice.toString()),
        offerPercent: double.parse(favItem.discount.toString()));
    favBox.put(favItem.id, favModelValue);
    isFavItem(productDetailC.productDetails.id);
    toastNotification(text: ' Item Added to Favourite');

    getFav();
  }

  removeFav(String id) {
    toastNotification(text: ' Item removed from Favourite');
    favBox.delete(id);

    getFav();
  }
}
