import 'package:flutter/material.dart';

class WeatherCondition {
  String? condName;
  IconData? icon;
  int? value;

  WeatherCondition({
    required this.condName,
    required this.icon,
    required this.value,
  });
}
