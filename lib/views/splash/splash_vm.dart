import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../home_vu/home_vu.dart';

class SplashScreenVM extends BaseViewModel {
  SplashScreenVM(context) {
    splash(context);
  }
  void splash(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return const HomeScreenVU();
            }), (route) => false));
  }
}
