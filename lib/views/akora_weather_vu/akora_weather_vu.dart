import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../models/data_model.dart';
import '../../models/day_cond_model.dart';
import '../../utils/util.dart';
import 'akora_weather_vm.dart';
import 'components/current_temp_and_cond.dart';
import 'components/current_weather_details.dart';
import 'components/custom_sliver_appbar.dart';
import 'components/hourly_based_temp_list.dart';
import 'components/next_two_week_temp.dart';
import 'components/sunrise_sunset_times.dart';
import 'components/today_temp_description.dart';

class WeatherScreenVU extends StackedView<WeatherScreenVM> {
  const WeatherScreenVU({
    super.key,
    required this.weatherList,
    required this.weatherCond,
  });
  final List<DataModel> weatherList;
  final List<WeatherCondition> weatherCond;

  @override
  Widget builder(
      BuildContext context, WeatherScreenVM viewModel, Widget? child) {
    if (weatherList.isEmpty) {
      debugPrint('DataList is empty');
      return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/bg1.jpeg'))),
        child: const Text(''),
      );
    } else {
      debugPrint('DataList is not empty');
      return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/bg1.jpeg'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          body: NestedScrollView(
            headerSliverBuilder: (_, innderBoxIsScrollable) {
              return [
                CustomSliverAppBar(weatherList: weatherList),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CurrentTempAndCond(weatherList: weatherList),
                    currentDayText(context),
                    const SizedBox(height: 20),
                    HourlyBasedTempList(
                        weatherList: weatherList, viewModel: viewModel),
                    const SizedBox(height: 20),
                    TodayTempDescription(weatherList: weatherList),
                    const SizedBox(height: 20),
                    NextTwoWeekTemp(
                        weatherList: weatherList, viewModel: viewModel),
                    const SizedBox(height: 20),
                    CurrentWeatherDetails(weatherCond: weatherCond),
                    const SizedBox(height: 20),
                    SunriseSunsetTimes(
                        weatherCond: weatherCond, weatherList: weatherList),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Padding currentDayText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        '${Utils.extractDay(weatherList.first.days!.first.datetime!)} ${weatherList.first.days!.first.tempmax!.toInt()} / ${weatherList.first.days!.first.tempmin!.toInt()}',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  WeatherScreenVM viewModelBuilder(BuildContext context) => WeatherScreenVM();
}
