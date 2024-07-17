import 'package:stacked/stacked.dart';
import '../../res/images/image_assets.dart';
import '../../utils/util.dart';

class WeatherScreenVM extends BaseViewModel {
  WeatherScreenVM();

  String getImage(int index, dataList) {
    return Utils.imageMap[
                dataList.first.days![0].hours![index].conditions.toString()] ==
            null
        ? ImageAssets.nightStarRain
        : Utils.imageMap[
            dataList.first.days![0].hours![index].conditions.toString()]!;
  }
}
