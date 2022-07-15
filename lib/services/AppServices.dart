import 'package:dio/dio.dart';
import 'package:fashio/models/all_products/all_products_model.dart';

String baseUrl = 'http://18.215.157.165:8080/api/users';

Future getDataResponse(endUrl) async {
  final dio = Dio();
  final response = await dio.get('$baseUrl$endUrl');

  if (response.statusCode == 200) {
    var res = response.data['data'];
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}

Future getResponse(endUrl) async {
  final dio = Dio();

  final response = await dio.get('$baseUrl$endUrl');

  if (response.statusCode == 200) {
    var res = response.data;

    return res;
  } else {
    throw Exception('Failed to load data');
  }
}

class AppServices {
  static var dio = Dio();

  static Future getAllProductDetails() async {
    final response = await dio.get('$baseUrl/all-products');

    if (response.statusCode == 200) {
      var jsonString = response.data;

      return allProductsModelFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future addToCart(dynamic data) async {
    final response = await dio.post('$baseUrl/add-to-cart', data: data);

    if (response.statusCode == 200) {
      var jsonString = response.data;

      return jsonString;
    } else {
      return null;
    }
  }

  static Future removeCartItem(Map<String, String>  data) async {
    try {
      final response = await dio.post('$baseUrl/remove-cart-item', data: data);
print(response.data);
      if (response.statusCode == 200) {
        var jsonString = response.data;

        return jsonString;
      } else {
        print('Failed to load data');
        return null;
      }
    } catch (e) {
      print('catchilanooooooooooo');
      throw Exception(e);
    }
  }
}
