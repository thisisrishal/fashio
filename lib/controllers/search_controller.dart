import 'package:fashio/models/search_model.dart';
import 'package:fashio/services/AppServices.dart';
import 'package:get/state_manager.dart';

class SearchController extends GetxController {
  RxList<SearchProduct> searchList = <SearchProduct>[].obs;
  late RxString keyword = ''.obs;
  RxBool isSearching = false.obs;
  RxBool isKeyboard = true.obs;
  RxString searchKeyword = ''.obs;


  void search(String searchTerm) {
    keyword.value = searchTerm;
    fetchSearchProduct();
  }

  fetchSearchProduct() async {
    try {
      var response = await AppServices.searchProduct(keyword: keyword.value);

      var searchModel = SearchModel.fromJson(response);

      searchList.value = searchModel.data.products;
    } catch (e) {
      throw e.toString();
    }
  }
}
