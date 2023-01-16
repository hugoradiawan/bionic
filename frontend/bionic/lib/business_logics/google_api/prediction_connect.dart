import 'package:bionic/business_logics/google_api/models/place_auto_complete.dart';
import 'package:get/get.dart';

class GooglePredictionConnect extends GetConnect {
  Future<PlaceAutoComplete?> placeAutoComplete(String keyword) async {
    final res = await get<Map<String, dynamic>>(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$keyword&key=AIzaSyAWrYSdilEh2B_BV5V2HBwI9Bx2ryqBxXo");
    if (res.isOk && res.body != null) {
      return PlaceAutoComplete.fromJson(res.body!);
    } else {
      return null;
    }
  }
}

