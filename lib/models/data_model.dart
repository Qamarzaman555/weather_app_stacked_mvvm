class DataModel {
  DataModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.days,
    this.alerts,
    this.stations,
    this.currentConditions,
  });

  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  List<CurrentConditions>? days;
  List<dynamic>? alerts;
  Stations? stations;
  CurrentConditions? currentConditions;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      queryCost: json["queryCost"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      resolvedAddress: json["resolvedAddress"],
      address: json["address"],
      timezone: json["timezone"],
      tzoffset: json["tzoffset"],
      days: json["days"] == null
          ? []
          : List<CurrentConditions>.from(
              json["days"]!.map((x) => CurrentConditions.fromJson(x))),
      alerts: json["alerts"] == null
          ? []
          : List<dynamic>.from(json["alerts"]!.map((x) => x)),
      stations:
          json["stations"] == null ? null : Stations.fromJson(json["stations"]),
      currentConditions: json["currentConditions"] == null
          ? null
          : CurrentConditions.fromJson(json["currentConditions"]),
    );
  }
}

class CurrentConditions {
  CurrentConditions({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  dynamic preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  double? tempmax;
  double? tempmin;
  double? feelslikemax;
  double? feelslikemin;
  double? precipcover;
  double? severerisk;
  String? description;
  List<CurrentConditions>? hours;

  factory CurrentConditions.fromJson(Map<String, dynamic> json) {
    return CurrentConditions(
      datetime: json["datetime"],
      datetimeEpoch: json["datetimeEpoch"],
      temp: json["temp"],
      feelslike: json["feelslike"],
      humidity: json["humidity"],
      dew: json["dew"],
      precip: json["precip"],
      precipprob: json["precipprob"],
      snow: json["snow"],
      snowdepth: json["snowdepth"],
      preciptype: json["preciptype"],
      windgust: json["windgust"],
      windspeed: json["windspeed"],
      winddir: json["winddir"],
      pressure: json["pressure"],
      visibility: json["visibility"],
      cloudcover: json["cloudcover"],
      solarradiation: json["solarradiation"],
      solarenergy: json["solarenergy"],
      uvindex: json["uvindex"],
      conditions: json["conditions"],
      icon: json["icon"],
      stations: json["stations"] == null
          ? []
          : List<String>.from(json["stations"]!.map((x) => x)),
      source: json["source"],
      sunrise: json["sunrise"],
      sunriseEpoch: json["sunriseEpoch"],
      sunset: json["sunset"],
      sunsetEpoch: json["sunsetEpoch"],
      moonphase: json["moonphase"],
      tempmax: json["tempmax"],
      tempmin: json["tempmin"],
      feelslikemax: json["feelslikemax"],
      feelslikemin: json["feelslikemin"],
      precipcover: json["precipcover"],
      severerisk: json["severerisk"],
      description: json["description"],
      hours: json["hours"] == null
          ? []
          : List<CurrentConditions>.from(
              json["hours"]!.map((x) => CurrentConditions.fromJson(x))),
    );
  }
}

class Stations {
  Stations({
    this.opps,
  });

  Opps? opps;

  factory Stations.fromJson(Map<String, dynamic> json) {
    return Stations(
      opps: json["OPPS"] == null ? null : Opps.fromJson(json["OPPS"]),
    );
  }
}

class Opps {
  Opps({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  double? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  String? id;
  String? name;
  int? quality;
  double? contribution;

  factory Opps.fromJson(Map<String, dynamic> json) {
    return Opps(
      distance: json["distance"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      useCount: json["useCount"],
      id: json["id"],
      name: json["name"],
      quality: json["quality"],
      contribution: json["contribution"],
    );
  }
}
