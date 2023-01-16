import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef JSON = Map<String, dynamic>;

extension PositionToLatLng on Position {
  LatLng get toLatLng => LatLng(latitude, longitude);
}
