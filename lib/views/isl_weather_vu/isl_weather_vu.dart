import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'isl_weather_vm.dart';

class ISLWeatherScreenVU extends StackedView<ISLWeatherScreenVM> {
  const ISLWeatherScreenVU({super.key});

  @override
  Widget builder(
      BuildContext context, ISLWeatherScreenVM viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        body: viewModel.dataList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Center(child: Text('${viewModel.dataList.first.address}')),
      ),
    );
  }

  @override
  ISLWeatherScreenVM viewModelBuilder(BuildContext context) =>
      ISLWeatherScreenVM();
}
