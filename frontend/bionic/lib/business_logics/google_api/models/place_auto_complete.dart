import 'package:bionic/business_logics/google_api/models/auto_complete_prediction.dart';

class PlaceAutoComplete {
  String? status;
  List<AutoCompletePrediction> prediction;

  PlaceAutoComplete({this.status, this.prediction = const []});

  factory PlaceAutoComplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutoComplete(
        status: json['status'] as String?,
        prediction: json['predictions'] != null
            ? json['predictions']
                .map<AutoCompletePrediction>(
                    (json) => AutoCompletePrediction.fromJson(json))
                .toList()
            : []);
  }
}