import 'package:fashio/models/all_products/all_products_model.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:get/state_manager.dart';

class AllProductsController extends GetxController {
  @override
  void onInit() {
    getAllProductDetails();

    super.onInit();
  }

  var productList = Rx<List<AllProducts>>([]);
  var categoryDetials = Rx<List<AllProducts>>([]);

  void getAllProductDetails() async {
    var products = await AppServices.getAllProductDetails();
    if (products != null) {
      productList.value = products.data.products;
    }
  }

  getCategoryDetails(String category) async {
    int count = 0;
    var details = Rx<Set<AllProducts>>({});

    for (var element in productList.value) {
      if (element.maincategoryname.toLowerCase() == category.toLowerCase() ||
          element.subcategoryname.toLowerCase() == category.toLowerCase()) {
        count = 1;
        details.value.add(element);
        categoryDetials.value = details.value.toList();
      }
    }
    if (count == 0) {
      categoryDetials.value = [];
    }
  }
}
