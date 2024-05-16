import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../models/data_model.dart';
import '../../models/day_cond_model.dart';
import '../../utils/util.dart';
import 'now_weather_vm.dart';

class NowWeatherScreenVU extends StackedView<NowWeatherScreenVM> {
  final List<DataModel> nowWeatherList;
  final List<WeatherCondition> nowWeatherCond;

  const NowWeatherScreenVU(
      {super.key, required this.nowWeatherList, required this.nowWeatherCond});

  @override
  Widget builder(
      BuildContext context, NowWeatherScreenVM viewModel, Widget? child) {
    if (nowWeatherList.isEmpty) {
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                forceMaterialTransparency: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    nowWeatherList.first.resolvedAddress!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.transparent,
                pinned: true,
                expandedHeight: 140,
              ),
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              nowWeatherList.first.days!.first.temp!
                                  .toInt()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 70,
                                      fontWeight: FontWeight.bold),
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
                                  nowWeatherList
                                      .first.currentConditions!.conditions
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${Utils.extractDay(nowWeatherList.first.days!.first.datetime!)} ${nowWeatherList.first.days!.first.tempmax!.toInt()} / ${nowWeatherList.first.days!.first.tempmin!.toInt()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 2,
                          color: Colors.transparent,
                          child: Container(
                            height: 130,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: nowWeatherList
                                  .first.days!.first.hours!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(
                                      Utils.extractHourFromEpoch(nowWeatherList
                                          .first
                                          .days!
                                          .first
                                          .hours![index]
                                          .datetimeEpoch!
                                          .toInt()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Image.asset(
                                      viewModel.getImage(index, nowWeatherList),
                                      height: 40,
                                      width: 40,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          nowWeatherList.first.days!.first
                                              .hours![index].temp!
                                              .toInt()
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
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
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(width: 20);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 2,
                          color: Colors.transparent,
                          child: Container(
                            height: 130,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Today Temperature',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${nowWeatherList.first.days!.first.description}',
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
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 2,
                          color: Colors.transparent,
                          child: Container(
                            height: 390,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ListView.separated(
                              itemCount: nowWeatherList.first.days!.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Utils.extractDay(nowWeatherList
                                          .first.days![index].datetime
                                          .toString()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      viewModel.getImage(index, nowWeatherList),
                                      height: 30,
                                      width: 30,
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${nowWeatherList.first.days![index].tempmax!.toInt()} / ${nowWeatherList.first.days![index].tempmin!.toInt()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 12);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
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
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 30),
                              Expanded(
                                child: GridView.builder(
                                    itemCount: nowWeatherCond.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                nowWeatherCond[index].icon,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                '${nowWeatherCond[index].condName}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                '${nowWeatherCond[index].value}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 2,
                          color: Colors.transparent,
                          child: Container(
                            height: 130,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      nowWeatherCond[0].icon,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Sunrise',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      Utils.formateTime(nowWeatherList
                                          .first.days!.first.sunrise!),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      nowWeatherCond[0].icon,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Sunset',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      Utils.formateTime(nowWeatherList
                                          .first.days!.first.sunset!),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }
  }

  @override
  NowWeatherScreenVM viewModelBuilder(BuildContext context) =>
      NowWeatherScreenVM();
}
