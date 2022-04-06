import 'package:dio/dio.dart';

class DioHelper {
  // For newsApp
  // 'https://newsapi.org/'

  // ?q=amman&APPID=7eb2c4620ea751d12c7e9db71e2c5ae9&units=metric
  //https://api.openweathermap.org/data/2.5/weather?q=amman&APPID=7eb2c4620ea751d12c7e9db71e2c5ae9&units=metric

  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.openweathermap.org',
        //  headers: {'lang': 'en', 'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true));
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //@GET
  static Future<Response> getData({required String url, // End Point
    Map<String, dynamic> ?query,
    }) async {

    return await dio.get(url, queryParameters: query);
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
