import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../res/images/image_assets.dart';
import 'splash_vm.dart';

class SplashScreenVU extends StackedView<SplashScreenVM> {
  const SplashScreenVU({super.key});

  @override
  Widget builder(
      BuildContext context, SplashScreenVM viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Image.asset(
          ImageAssets.nightStarRain,
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  @override
  SplashScreenVM viewModelBuilder(BuildContext context) => SplashScreenVM(context);
}
