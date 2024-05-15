import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../models/data_model.dart';
import '../../models/day_cond_model.dart';
import '../home_vu/home_vu.dart';

class SplashScreenVM extends BaseViewModel {
  List<DataModel> dataList = [];

  List<WeatherCondition> weather = [];
  SplashScreenVM(context) {
    splash(context);
  }

  void splash(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreenVU(dataList: dataList, weather: weather);
            }), (route) => false));
  }
}
