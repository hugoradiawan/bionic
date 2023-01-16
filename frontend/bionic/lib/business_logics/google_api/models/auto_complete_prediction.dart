class AutoCompletePrediction {
  String? description;
  StructuredFormatting? structuredFormatting;
  String? placeid;
  String? reference;

  AutoCompletePrediction(
      {this.description,
      this.structuredFormatting,
      this.placeid,
      this.reference});
  factory AutoCompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutoCompletePrediction(
        description: json['description'] as String?,
        placeid: json['place_id'] as String?,
        reference: json['reference'] as String?,
        structuredFormatting: json['structured_formatting'] != null
            ? StructuredFormatting.fromJson(json['structured_formatting'])
            : null);
  }
}

class StructuredFormatting {
  String? mainText;
  String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});
  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
        mainText: json['main_text'] as String?,
        secondaryText: json['secondary_text'] as String?);
  }
}