import 'package:flutter/material.dart';

import '../../../models/data_model.dart';

class TodayTempDescription extends StatelessWidget {
  const TodayTempDescription({
    super.key,
    required this.weatherList,
  });

  final List<DataModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      child: Container(
        height: 140,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Text(
              'Today Temperature',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: Text(
                '${weatherList.first.days!.first.description}',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
