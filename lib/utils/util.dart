import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ResponsiveExtension on num {
  // Responsive dimensions based on screen height and width
  double responsiveHeight(BuildContext context) =>
      (toDouble() / 100) * MediaQuery.of(context).size.height;

  double responsiveWidth(BuildContext context) =>
      (toDouble() / 100) * MediaQuery.of(context).size.width;

  // Spacing widgets with responsive dimensions
  Widget spaceY(BuildContext context) => SizedBox(
        height: responsiveHeight(context),
      );

  Widget spaceX(BuildContext context) => SizedBox(
        width: responsiveWidth(context),
      );
}

class Utils {
  static Map<dynamic, String> imageMap = {
    'Partially cloudy': 'assets/images/nightRain.png',
    'Overcast': 'assets/images/sunSlowRain.png',
    'Clear': 'assets/images/wind.png',
    null: 'assets/images/nightStatRain.png'
  };

  // formate date
  static String formateDate(DateTime date) {
    String formattedDate = DateFormat('EEEE d MMM').format(date);
    return formattedDate;
  }

  // extract date only
  static String extractDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d').format(dateTime);
    return formattedDate;
  }

  static String extractDay(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('EEEE').format(dateTime);
    return formattedDate.substring(0, 3);
  }

  // formate time with am/pm
  static String formateTime(String time) {
    DateFormat dateFormat = DateFormat('hh:mm a');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    String timeIn12HourFormat = dateFormat.format(dateTime);
    return timeIn12HourFormat;
  }

  //current time
  static String currentTime() {
    DateFormat dateFormat = DateFormat('hh:mm a');
    DateTime now = DateTime.now();
    String time = dateFormat.format(now);
    return time;
  }

  // formate time without
  static String formateTimeWithout(String time) {
    DateFormat dateFormat = DateFormat('hh:mm');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    String timeIn12HourFormat = dateFormat.format(dateTime);
    return timeIn12HourFormat;
  }

  static bool checkTime(String time) {
    DateFormat dateFormat = DateFormat('hh a');
    DateTime dateTime = DateTime.parse('2023-08-08T$time');
    DateTime now = DateTime.now();
    return dateFormat.format(dateTime) == dateFormat.format(now);
  }

  static String extractHourFromEpoch(int epoch) {
    // Convert epoch to DateTime object
    DateTime dtObject = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    // Extract hour in 12-hour format
    String hour = DateFormat('h:mm a').format(dtObject);
    return hour;
  }
}
