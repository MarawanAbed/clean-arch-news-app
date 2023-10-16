import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  final _baseUrl = 'https://newsapi.org/';
  static const apiKey = '3f5cc759fec4459da8f6b283a074fa4e';

// https://newsapi.org/v2/top-headlines?category=science&country=eg&apiKey=1ee68e89880d49c5b49615c6273d0cfb

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}