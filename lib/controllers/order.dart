import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wasafi_market/constant.dart';
import 'package:wasafi_market/models/map.dart';

class OrderController extends GetxController implements GetxService {
  List _mapSearch = [];

  List get mapSearch => _mapSearch;

  // fetch mapPlace
  Future<void> fetchPlaces(placeName) async {
    var response = await Dio().get(
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$placeName.json?proximity=39.178326,-6.776012&access_token=${AppConstant.MAP_KEY}&country=TZ&limit=10");
    if (placeName.length == 0) {
      _mapSearch = [];
      update();
    }

    if (response.statusCode == 200) {
      _mapSearch = [];
      _mapSearch.addAll(MapSearch.fromJson(response.data).features);
      update();
    } else {
      _mapSearch = [];
      update();
    }
  }
}


// oa.6e362f1c1412c6c6aaf7cf6bdbb851e61ad3a412f9466b47c5decbdea0192912