import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'now_weather_vm.dart';

class NowWeatherScreenVU extends StackedView<NowWeatherScreenVM> {
  const NowWeatherScreenVU({super.key});

  @override
  Widget builder(
      BuildContext context, NowWeatherScreenVM viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        body: viewModel.dataList.isEmpty
            ? const Center(child:  CircularProgressIndicator())
            : Center(
                child: Text('${viewModel.dataList.first.address}')),
      ),
    );
  }
  @override
  NowWeatherScreenVM viewModelBuilder(BuildContext context) =>
      NowWeatherScreenVM();
}
