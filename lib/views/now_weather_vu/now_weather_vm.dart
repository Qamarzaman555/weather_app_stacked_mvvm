import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '../../models/data_model.dart';
import '../../models/day_cond_model.dart';
import '../../res/app_url/app_url.dart';
import '../../res/images/image_assets.dart';
import '../../utils/util.dart';

class NowWeatherScreenVM extends BaseViewModel {
  List<DataModel> dataList = [];
  List<WeatherCondition> weather = [];

  NowWeatherScreenVM() {
    getData();
  }

  getData() async {
    setBusy(true);
    final response = await http.get(Uri.parse(AppUrl.now));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // Extract DataModel
      final dataModel = DataModel.fromJson(body);
      dataList.add(dataModel);
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    weather = [
      WeatherCondition(
        condName: 'Feels like',
        icon: Icons.thermostat,
        value: dataList[0].days![0].feelslike!.toInt(),
      ),
      WeatherCondition(
        condName: 'Wind',
        icon: Icons.air,
        value: dataList[0].days![0].windspeed!.toInt(),
      ),
      WeatherCondition(
        condName: 'Humadity',
        icon: Icons.water_drop_outlined,
        value: dataList[0].days![0].humidity!.toInt(),
      ),
      WeatherCondition(
        condName: 'Dew',
        icon: Icons.water_drop,
        value: dataList[0].days![0].dew!.toInt(),
      ),
      WeatherCondition(
        condName: 'UV',
        icon: Icons.wb_sunny_outlined,
        value: dataList[0].days![0].uvindex!.toInt(),
      ),
      WeatherCondition(
        condName: 'Air pressure',
        icon: Icons.wb_iridescent,
        value: dataList[0].days![0].pressure!.toInt(),
      ),
    ];
    setBusy(false);
  }

  String getImage(int index, dataList) {
    return Utils.imageMap[
                dataList.first.days![0].hours![index].conditions.toString()] ==
            null
        ? ImageAssets.nightStarRain
        : Utils.imageMap[
            dataList.first.days![0].hours![index].conditions.toString()]!;
  }
}
