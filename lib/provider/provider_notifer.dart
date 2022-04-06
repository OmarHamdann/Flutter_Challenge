import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../network/dio_helper.dart';
import '../sorting.dart';

class LoginProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  String userName = '';
  bool visibility = true;

  void changeVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  getWeatherInfo(context, String city) {
    DioHelper.getData(url: '/data/2.5/weather', query: {
      'q': city,
      'APPID': '7eb2c4620ea751d12c7e9db71e2c5ae9',
      'units': 'metric',
    }).then((value) {
      weatherModel = WeatherModel.fromJson(value.data);
      notifyListeners();
      print(value.data);
    }).catchError((onError) {
            ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString(),maxLines: 1,),backgroundColor: Colors.red,));
    });
  }

  void allowAccess(userName, context) {
    this.userName = userName;
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Sort()));
    // notifyListeners();
  }
}
