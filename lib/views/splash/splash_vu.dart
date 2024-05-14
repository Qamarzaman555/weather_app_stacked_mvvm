import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_vm.dart';

class SplashScreenVU extends StackedView<SplashScreenVM> {
  const SplashScreenVU({super.key});

  @override
  Widget builder(
          BuildContext context, SplashScreenVM viewModel, Widget? child) =>
      const SizedBox.shrink();

  @override
  SplashScreenVM viewModelBuilder(BuildContext context) => SplashScreenVM();
}
