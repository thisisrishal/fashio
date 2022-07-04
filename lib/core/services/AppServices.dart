import 'package:dio/dio.dart';
import 'package:fashio/configs/appConfig.dart';

Future getDataResponse(endUrl) async {
  final dio = Dio();

  final response = await dio.get('$baseUrl$endUrl');
  // print('getting data is == $response');

  if (response.statusCode == 200) {
    var res = response.data['data'];
    // print(res);
    return res;
  } else {
    throw Exception('Failed to load data');
  }
}

Future getResponse(endUrl) async {
  final dio = Dio();

  final response = await dio.get('$baseUrl$endUrl');
  // print('getting data is == $response');

  if (response.statusCode == 200) {
    var res = response.data;
    // print(res);

    return res;
  } else {
    throw Exception('Failed to load data');
  }
}


