import 'package:bionic/business_logics/google_api/models/place_auto_complete.dart';
import 'package:bionic/business_logics/google_api/prediction_connect.dart';
import 'package:get/get.dart';

class GooglePredictionController extends GetxController {
  final Rxn<PlaceAutoComplete> result = Rxn<PlaceAutoComplete>();
  final GooglePredictionConnect connect = GooglePredictionConnect();

  Future<void> getPrediction(String text) async {
    if (text.isNotEmpty) {
      result.value = await connect.placeAutoComplete(text);
    }
  }
}