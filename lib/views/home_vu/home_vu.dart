import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../akora_weather_vu/akora_weather_vu.dart';
import '../isl_weather_vu/isl_weather_vu.dart';
import '../now_weather_vu/now_weather_vu.dart';
import 'home_vm.dart';

class HomeScreenVU extends StackedView<HomeScreenVM> {
  const HomeScreenVU({super.key});

  @override
  Widget builder(BuildContext context, HomeScreenVM viewModel, Widget? child) {
    return Scaffold(
      body: PageView(
        controller: PageController(initialPage: 0),
        children: const [
          AkoraWeatherScreenVU(),
          ISLWeatherScreenVU(),
          NowWeatherScreenVU(),
        ],
      ),
    );
  }

  @override
  HomeScreenVM viewModelBuilder(BuildContext context) => HomeScreenVM();
}
