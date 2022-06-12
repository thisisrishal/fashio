// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dio/dio.dart';

// Dio? _dio;

// const baseUrl = "https://reqres.in/";

// Httpservice() {
//   _dio = Dio(BaseOptions(
//     baseUrl: baseUrl,

//     // connectTimeout: 5000,
//     // receiveTimeout: 3000,
//   ));
// }

// InitializeInterceptors() {
//   _dio!.interceptors.add(InterceptorsWrapper(
//     onError: (error) {
//       print(error.message);
//     },
//     onRequest: (request) {
//       print(request.path);
//     },
//   ));
// }
