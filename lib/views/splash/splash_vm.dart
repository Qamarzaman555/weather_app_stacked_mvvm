import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../models/data_model.dart';
import '../../models/day_cond_model.dart';
import '../../res/app_url/app_url.dart';
import '../home_vu/home_vu.dart';
import 'package:http/http.dart' as http;

class SplashScreenVM extends BaseViewModel {
  List<DataModel> akoraWeatherList = [];
  List<DataModel> islWeatherList = [];
  List<DataModel> nowWeatherList = [];
  List<WeatherCondition> akoraWeatherCond = [];
  List<WeatherCondition> islWeatherCond = [];
  List<WeatherCondition> nowWeatherCond = [];

  SplashScreenVM(BuildContext context) {
    _initialize(context);
  }

  Future<void> _initialize(BuildContext context) async {
    setBusy(true);
    await getAkoraWeather();
    await getIslWeather();
    await getNowWeather();
    setBusy(false);
    splash(context);
  }

  void splash(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreenVU(
            akoraWeatherList: akoraWeatherList,
            akoraWeatherCond: akoraWeatherCond,
            islWeatherList: islWeatherList,
            islWeatherCond: islWeatherCond,
            nowWeatherList: nowWeatherList,
            nowWeatherCond: nowWeatherCond,
          );
        }),
        (route) => false,
      ),
    );
  }

  Future<void> getAkoraWeather() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.akora));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        // Extract DataModel
        final dataModel = DataModel.fromJson(body);
        akoraWeatherList.add(dataModel);

        // Prepare weather data
        akoraWeatherCond = [
          WeatherCondition(
            condName: 'Feels like',
            icon: Icons.thermostat,
            value: akoraWeatherList[0].days![0].feelslike!.toInt(),
          ),
          WeatherCondition(
            condName: 'Wind',
            icon: Icons.air,
            value: akoraWeatherList[0].days![0].windspeed!.toInt(),
          ),
          WeatherCondition(
            condName: 'Humidity',
            icon: Icons.water_drop_outlined,
            value: akoraWeatherList[0].days![0].humidity!.toInt(),
          ),
          WeatherCondition(
            condName: 'Dew',
            icon: Icons.water_drop,
            value: akoraWeatherList[0].days![0].dew!.toInt(),
          ),
          WeatherCondition(
            condName: 'UV',
            icon: Icons.wb_sunny_outlined,
            value: akoraWeatherList[0].days![0].uvindex!.toInt(),
          ),
          WeatherCondition(
            condName: 'Air pressure',
            icon: Icons.wb_iridescent,
            value: akoraWeatherList[0].days![0].pressure!.toInt(),
          ),
        ];

        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle error
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> getIslWeather() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.isl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        // Extract DataModel
        final dataModel = DataModel.fromJson(body);
        islWeatherList.add(dataModel);

        // Prepare weather data
        islWeatherCond = [
          WeatherCondition(
            condName: 'Feels like',
            icon: Icons.thermostat,
            value: islWeatherList[0].days![0].feelslike!.toInt(),
          ),
          WeatherCondition(
            condName: 'Wind',
            icon: Icons.air,
            value: islWeatherList[0].days![0].windspeed!.toInt(),
          ),
          WeatherCondition(
            condName: 'Humidity',
            icon: Icons.water_drop_outlined,
            value: islWeatherList[0].days![0].humidity!.toInt(),
          ),
          WeatherCondition(
            condName: 'Dew',
            icon: Icons.water_drop,
            value: islWeatherList[0].days![0].dew!.toInt(),
          ),
          WeatherCondition(
            condName: 'UV',
            icon: Icons.wb_sunny_outlined,
            value: islWeatherList[0].days![0].uvindex!.toInt(),
          ),
          WeatherCondition(
            condName: 'Air pressure',
            icon: Icons.wb_iridescent,
            value: islWeatherList[0].days![0].pressure!.toInt(),
          ),
        ];

        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle error
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> getNowWeather() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.now));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        // Extract DataModel
        final dataModel = DataModel.fromJson(body);
        nowWeatherList.add(dataModel);

        // Prepare weather data
        nowWeatherCond = [
          WeatherCondition(
            condName: 'Feels like',
            icon: Icons.thermostat,
            value: nowWeatherList[0].days![0].feelslike!.toInt(),
          ),
          WeatherCondition(
            condName: 'Wind',
            icon: Icons.air,
            value: nowWeatherList[0].days![0].windspeed!.toInt(),
          ),
          WeatherCondition(
            condName: 'Humidity',
            icon: Icons.water_drop_outlined,
            value: nowWeatherList[0].days![0].humidity!.toInt(),
          ),
          WeatherCondition(
            condName: 'Dew',
            icon: Icons.water_drop,
            value: nowWeatherList[0].days![0].dew!.toInt(),
          ),
          WeatherCondition(
            condName: 'UV',
            icon: Icons.wb_sunny_outlined,
            value: nowWeatherList[0].days![0].uvindex!.toInt(),
          ),
          WeatherCondition(
            condName: 'Air pressure',
            icon: Icons.wb_iridescent,
            value: nowWeatherList[0].days![0].pressure!.toInt(),
          ),
        ];

        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle error
      throw Exception('Failed to load data: $e');
    }
  }
}
