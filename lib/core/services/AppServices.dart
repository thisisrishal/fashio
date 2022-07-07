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

// class AppServices {
//   static var dio = Dio();

//   static String basicUrl = 'http://18.215.157.165:8080/api/users';

//   static Future requestOtp() async {
//     var response = await dio.post('$basicUrl/signup', data: {
//       "mobilenumber": "8136860910"
//     });

//     if (response.statusCode == 200) {
//       var res = response.data;
//       print("Response:");
//       print("Status:\n${res.statusCode}");
//       print("Header:\n${res.headers}");
//       print("Data:\n${res.data}");
//       print('${res['message']} - -  -  this is the message');
//       return res['message'];
//     } else {
//       return '';
//     }
//   }
// }
