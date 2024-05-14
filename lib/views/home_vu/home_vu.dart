import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_vm.dart';

class HomeScreenVU extends StackedView<HomeScreenVM> {
  const HomeScreenVU({super.key});

  @override
  Widget builder(BuildContext context, HomeScreenVM viewModel, Widget? child) {
    return const Scaffold(
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }

  @override
  HomeScreenVM viewModelBuilder(BuildContext context) => HomeScreenVM();
}
