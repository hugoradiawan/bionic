import 'dart:async';

import 'package:bionic/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:photo_manager/photo_manager.dart' as pm;

import 'location_tracker_controller.dart';

class MapController extends GetxController {
  late GoogleMapController? mapController;
  final Completer<GoogleMapController> _completer =
      Completer<GoogleMapController>();
  final RxSet<Marker> markers = RxSet<Marker>();
  late Rxn<Position> currentPosition = Get.find<LocationTracker>().position;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
    Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
    Factory<VerticalDragGestureRecognizer>(
      () => VerticalDragGestureRecognizer(),
    )
  };

  CameraPosition get initialCameraPosition => CameraPosition(
        target: currentPosition.value?.toLatLng ??
            const LatLng(-6.2215783, 106.8415612),
        zoom: 17,
      );

  void updateController(GoogleMapController? controller) {
    if (!_completer.isCompleted) {
      _completer.complete(controller);
      mapController = controller;
    }
  }

  CameraPosition getCameraPosition(LatLng pos) =>
      CameraPosition(target: pos, zoom: 17);
}

class LocalPhotoManager extends GetxController {
  final RxList<pm.AssetPathEntity> paths = RxList<pm.AssetPathEntity>();
  final RxList<pm.AssetEntity> entities = RxList<pm.AssetEntity>();
  final List<String> constUrls = [
    'https://awsimages.detik.net.id/community/media/visual/2021/07/12/gambar-ilustrasi-presiden-jokowi-memegang-petromaks-sumer-akun-twitter-presiden-jokowi.jpeg?w=650&q=80',
    'https://i.pinimg.com/originals/30/17/15/30171515e7fea691b1edd188c5e63326.jpg',
    'https://cdn.antaranews.com/cache/800x533/2020/04/18/PSX_20200418_114105.jpg',
    'https://blogpictures.99.co/gambar-rumah-minimalis.jpg',
    'https://storage.googleapis.com/brighton-assets/Uploads/Images/4299540/uoYrwJrt/Harga-Rumah-Minimalis-Medium.webp'
  ];
  @override
  Future<void> onReady() async {
    final pm.FilterOptionGroup filterOptionGroup = pm.FilterOptionGroup(
      imageOption: const pm.FilterOption(
        sizeConstraint: pm.SizeConstraint(ignoreSize: true),
      ),
    );
    final pm.PermissionState ps =
        await pm.PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      final t = await pm.PhotoManager.getAssetPathList(
          type: pm.RequestType.image,
          onlyAll: true,
          filterOption: filterOptionGroup);
      paths.assignAll(t);
      await fetchLocalAssetList();
    } else {
      pm.PhotoManager.openSetting();
    }
    super.onReady();
  }

  fetchLocalAssetList() async {
    final List<Future<List<pm.AssetEntity>>> temp =
        paths.map((e) => e.getAssetListPaged(page: 1, size: 20)).toList();
    entities.assignAll((await Future.wait(temp))
        .fold([], (previousValue, element) => [...previousValue, ...element]));
  }
}
