import 'package:flutter/material.dart';

import '../../../models/data_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.weatherList,
  });

  final List<DataModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black26,
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          weatherList.first.resolvedAddress!,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
