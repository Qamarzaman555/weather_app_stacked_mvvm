import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import '../../model/data_model.dart';
import '../../res/app_url/app_url.dart';

class ISLWeatherScreenVM extends BaseViewModel {
  List<DataModel> dataList = [];
  List<CurrentConditions> currentConditionsList = [];
  List<dynamic> alertsList = [];
  List<Stations> stationsList = [];

  ISLWeatherScreenVM() {
    getData();
  }

  getData() async {
    setBusy(true);
    final response = await http.get(Uri.parse(AppUrl.isl));

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
}
