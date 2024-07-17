import 'package:flutter/material.dart';

import '../../../models/data_model.dart';
import '../../../models/day_cond_model.dart';
import '../../../utils/util.dart';

class SunriseSunsetTimes extends StatelessWidget {
  const SunriseSunsetTimes({
    super.key,
    required this.weatherCond,
    required this.weatherList,
  });

  final List<WeatherCondition> weatherCond;
  final List<DataModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        height: 130,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  weatherCond[0].icon,
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  'Sunrise',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  Utils.formateTime(weatherList.first.days!.first.sunrise!),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  weatherCond[0].icon,
                  size: 24,
                  color: Colors.white,
                ),
                Text(
                  'Sunset',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  Utils.formateTime(weatherList.first.days!.first.sunset!),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
