import 'package:bionic/business_logics/google_api/google_prediction_controller.dart';
import 'package:bionic/uis/base_navigation/bottom_menus/search_page/search_tile.dart';
import 'package:bionic/business_logics/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(_) => Column(children: [
        Expanded(
          flex: 5,
          child: GetX<MapController>(
            init: MapController(),
            builder: (mapController) => GoogleMap(
              onMapCreated: mapController.updateController,
              initialCameraPosition: mapController.initialCameraPosition,
              myLocationEnabled: true,
              mapType: MapType.terrain,
              markers: mapController.markers.toSet(),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: GetX<GooglePredictionController>(
            init: GooglePredictionController(),
            builder: (gpc) => Column(children: [
              Expanded(
                flex: 1,
                child: SearchTile(
                  (val) {
                    gpc.getPrediction(val);
                  },
                  label: 'Location',
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(children: [
                  for (int i = 0;
                      i < (gpc.result.value?.prediction.length ?? 0);
                      i++)
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.pin_drop)),
                      title: Text(
                        gpc.result.value?.prediction[i].description
                                ?.split(",")[0] ??
                            '',
                      ),
                      subtitle: Text(
                        gpc.result.value?.prediction[i].description ?? '',
                      ),
                    )
                ]),
              ),
            ]),
          ),
        ),
      ]);
}
