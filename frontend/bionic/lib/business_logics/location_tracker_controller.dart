import 'package:bionic/uis/dialog_location_permission.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class LocationTracker extends GetxController {
  final Rx<bool> permissionGranted = false.obs;
  final Rxn<Position> position = Rxn<Position>();

  Future<bool> getPermission() async {
    ph.PermissionStatus? status;
    final ph.ServiceStatus serviceStatus =
        await ph.Permission.locationWhenInUse.serviceStatus;
    if (serviceStatus == ph.ServiceStatus.enabled) {
      return true;
    } else {
      ph.PermissionStatus status =
          await ph.Permission.locationWhenInUse.request();
      if (status == ph.PermissionStatus.granted) {
        return true;
      } else if (status == ph.PermissionStatus.denied) {
        Get.dialog(PermissionRequestDialog(Colors.purple, 0, () {
          Get.back();
        }, () async {
          status = await ph.Permission.locationWhenInUse.request();
        }));
      } else if (status == ph.PermissionStatus.permanentlyDenied) {
        await ph.openAppSettings();
      }
    }
    return status == ph.PermissionStatus.granted;
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }
    position.value = await Geolocator.getCurrentPosition();
  }

  static void init() async {
    Get.lazyPut(() => LocationTracker(), fenix: true);
  }
}
