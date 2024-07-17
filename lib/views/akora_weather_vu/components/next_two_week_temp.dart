import 'package:flutter/material.dart';

import '../../../models/data_model.dart';
import '../../../utils/util.dart';
import '../akora_weather_vm.dart';

class NextTwoWeekTemp extends StatelessWidget {
  const NextTwoWeekTemp(
      {super.key, required this.weatherList, required this.viewModel});

  final List<DataModel> weatherList;
  final WeatherScreenVM viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        height: 390,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListView.separated(
          itemCount: weatherList.first.days!.length,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.extractDay(
                      weatherList.first.days![index].datetime.toString()),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Image.asset(
                  viewModel.getImage(index, weatherList),
                  height: 30,
                  width: 30,
                ),
                const Spacer(),
                Text(
                  '${weatherList.first.days![index].tempmax!.toInt()} / ${weatherList.first.days![index].tempmin!.toInt()}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 12);
          },
        ),
      ),
    );
  }
}
