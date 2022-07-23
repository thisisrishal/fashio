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

  static Future removeCartItem(Map<String, String> data) async {
    try {
      final response = await dio.put('$baseUrl/remove-cart-item', data: data);
      if (response.statusCode == 200) {
        var jsonString = response.data;

        return jsonString;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//? not loading data from server
  static Future getCoupons() async {
    try {
      final response = await dio.get('$baseUrl/user-coupon-data');

      if (response.statusCode == 200) {
        var jsonString = response.data;

        return jsonString;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future searchProduct({required String keyword}) async {
    try {
      final response = await dio.get('$baseUrl/search-product/$keyword');

      if (response.statusCode == 200) {
        var jsonString = response.data;

        return jsonString;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future getAddress(String userid) async {
    try {
      final response = await dio.get('$baseUrl/user-address-data/$userid');

      if (response.statusCode == 200) {
        var jsonString = response.data;

        return jsonString;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future addAddress({
    required String userid,
    required String name,
    required String houseName,
    required String area,
    required String state,
    required String phno,
    required String city,
    required String pincode,
  }) async {
    try {
      final response = await dio.post('$baseUrl/add-new-address', data: {
        "userId": userid,
        "firstName": name,
        "lastName": " ",
        "address1": houseName,
        "address2": area,
        "mobileNumber": phno,
        "city": city,
        "state": state,
        "pincode": pincode
      });

      if (response.statusCode == 200) {
        var jsonString = response.data;

        return jsonString;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
