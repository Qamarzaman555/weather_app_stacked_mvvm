import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../utils/get_icon.dart';
import '../../utils/util.dart';
import 'akora_weather_vm.dart';

class AkoraWeatherScreenVU extends StackedView<AkoraWeatherScreenVM> {
  const AkoraWeatherScreenVU({super.key});

  @override
  Widget builder(
      BuildContext context, AkoraWeatherScreenVM viewModel, Widget? child) {
    return SafeArea(
      child: viewModel.dataList.isEmpty
          ? const Text('')
          : Scaffold(
              backgroundColor: Colors.blue,
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                    // forceMaterialTransparency: true,
                    bottom: appBarContents(viewModel, context),
                    backgroundColor: Colors.red,
                    pinned: true,
                    expandedHeight: 140,
                    collapsedHeight: 70,
                  ),
                  SliverToBoxAdapter(
                      child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                viewModel.dataList.first.days!.first.temp!
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.circle_outlined,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    viewModel.dataList.first.currentConditions!
                                        .conditions
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
                            '${Utils.extractDay(viewModel.dataList.first.days!.first.datetime!)} ${viewModel.dataList.first.days!.first.tempmax!.toInt()} / ${viewModel.dataList.first.days!.first.tempmin!.toInt()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 130,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.red),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.dataList.first.days!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(
                                      Utils.extractHourFromEpoch(viewModel
                                          .dataList
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
                                    Image.asset(
                                      viewModel.getImage(index),
                                      height: 50,
                                      width: 50,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          viewModel.dataList.first.days!.first
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
                          const SizedBox(height: 20),
                          Container(
                            height: 130,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.red),
                            child: Column(
                              children: [
                                Text(
                                  'Today Temprature',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${viewModel.dataList.first.days!.first.description}',
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
                          const SizedBox(height: 20),
                          Container(
                            height: 390,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 24),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.red),
                            child: ListView.separated(
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Utils.extractDay(viewModel
                                          .dataList.first.days![index].datetime
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
                                      viewModel.getImage(index),
                                      height: 30,
                                      width: 30,
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${viewModel.dataList.first.days!.first.tempmax!.toInt()} / ${viewModel.dataList.first.days!.first.tempmin!.toInt()}',
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
                          Text(
                            'Weather Details',
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
                  ))
                ],
              ),
            ),
    );
  }

  PreferredSize appBarContents(
      AkoraWeatherScreenVM viewModel, BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 0),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(
            Icons.place,
            color: Colors.white,
            size: 20,
          ),
          Text(
            viewModel.dataList.first.resolvedAddress!,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  AkoraWeatherScreenVM viewModelBuilder(BuildContext context) =>
      AkoraWeatherScreenVM();
}
