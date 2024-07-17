import 'package:flutter/material.dart';

import '../../../models/day_cond_model.dart';

class CurrentWeatherDetails extends StatelessWidget {
  const CurrentWeatherDetails({
    super.key,
    required this.weatherCond,
  });

  final List<WeatherCondition> weatherCond;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Details',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: weatherCond.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 120,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            weatherCond[index].icon,
                            size: 24,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${weatherCond[index].condName}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${weatherCond[index].value}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
