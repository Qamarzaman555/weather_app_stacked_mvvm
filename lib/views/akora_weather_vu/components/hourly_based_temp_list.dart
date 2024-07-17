import 'package:flutter/material.dart';

import '../../../models/data_model.dart';
import '../../../utils/util.dart';
import '../akora_weather_vm.dart';

class HourlyBasedTempList extends StatelessWidget {
  const HourlyBasedTempList({
    super.key,
    required this.weatherList,
    required this.viewModel,
  });

  final List<DataModel> weatherList;
  final WeatherScreenVM viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        height: 130,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: weatherList.first.days!.first.hours!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  Utils.extractHourFromEpoch(weatherList
                      .first.days!.first.hours![index].datetimeEpoch!
                      .toInt()),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Image.asset(
                  viewModel.getImage(index, weatherList),
                  height: 40,
                  width: 40,
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weatherList.first.days!.first.hours![index].temp!
                          .toInt()
                          .toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.circle_outlined,
                      size: 4,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}
