import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather/models/data_model.dart';
import 'package:weather/models/day_cond_model.dart';

import '../akora_weather_vu/akora_weather_vu.dart';
import 'home_vm.dart';

class HomeScreenVU extends StackedView<HomeScreenVM> {
  final List<DataModel> akoraWeatherList, islWeatherList, nowWeatherList;
  final List<WeatherCondition> akoraWeatherCond, islWeatherCond, nowWeatherCond;
  const HomeScreenVU(
      {super.key,
      required this.akoraWeatherList,
      required this.akoraWeatherCond,
      required this.islWeatherList,
      required this.islWeatherCond,
      required this.nowWeatherList,
      required this.nowWeatherCond});

  @override
  Widget builder(BuildContext context, HomeScreenVM viewModel, Widget? child) {
    return Scaffold(
      body: PageView(
        controller: PageController(initialPage: 0),
        children: [
          WeatherScreenVU(
            weatherList: akoraWeatherList,
            weatherCond: akoraWeatherCond,
          ),
          WeatherScreenVU(
            weatherList: islWeatherList,
            weatherCond: islWeatherCond,
          ),
          WeatherScreenVU(
            weatherList: nowWeatherList,
            weatherCond: nowWeatherCond,
          ),
        ],
      ),
    );
  }

  @override
  HomeScreenVM viewModelBuilder(BuildContext context) => HomeScreenVM();
}
