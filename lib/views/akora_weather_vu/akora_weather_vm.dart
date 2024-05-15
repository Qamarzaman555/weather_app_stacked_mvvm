import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '../../model/data_model.dart';
import '../../res/app_url/app_url.dart';
import '../../res/images/image_assets.dart';
import '../../utils/util.dart';

class AkoraWeatherScreenVM extends BaseViewModel {
  final double? extendedHeight = 140;
  List<DataModel> dataList = [];
  List<CurrentConditions> currentConditionsList = [];
  List<dynamic> alertsList = [];
  List<Stations> stationsList = [];

  AkoraWeatherScreenVM() {
    getData();
  }

  getData() async {
    setBusy(true);
    final response = await http.get(Uri.parse(AppUrl.akora));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      // Extract DataModel
      final dataModel = DataModel.fromJson(body);
      dataList.add(dataModel);

      // Extract CurrentConditions
      if (dataModel.days != null && dataModel.days!.isNotEmpty) {
        currentConditionsList.addAll(dataModel.days!.first.hours ?? []);
      }

      // Extract Alerts
      if (dataModel.alerts != null) {
        alertsList.addAll(dataModel.alerts!);
      }

      // Extract Stations
      if (dataModel.stations != null) {
        stationsList.add(dataModel.stations!);
      }

      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    setBusy(false);
  }

  String getImage(int index) {
    return Utils.imageMap[
                dataList.first.days![0].hours![index].conditions.toString()] ==
            null
        ? ImageAssets.nightStarRain
        : Utils.imageMap[
            dataList.first.days![0].hours![index].conditions.toString()]!;
  }
}
