import 'package:flutter/material.dart';

import '../../../models/data_model.dart';

class CurrentTempAndCond extends StatelessWidget {
  const CurrentTempAndCond({super.key, required this.weatherList});
  final List<DataModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            weatherList.first.days!.first.temp!.toInt().toString(),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.circle_outlined,
                size: 16,
                color: Colors.white,
              ),
              Text(
                weatherList.first.currentConditions!.conditions.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
