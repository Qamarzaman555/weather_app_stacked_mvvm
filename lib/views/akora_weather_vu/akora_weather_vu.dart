import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'akora_weather_vm.dart';

class AkoraWeatherScreenVU extends StackedView<AkoraWeatherScreenVM> {
  const AkoraWeatherScreenVU({super.key});

  @override
  Widget builder(
      BuildContext context, AkoraWeatherScreenVM viewModel, Widget? child) {
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
  AkoraWeatherScreenVM viewModelBuilder(BuildContext context) =>
      AkoraWeatherScreenVM();
}
