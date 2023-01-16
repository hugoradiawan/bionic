import 'package:bionic/bionic_app.dart';
import 'package:bionic/business_logics/firebase_messaging_controller.dart';
import 'package:bionic/business_logics/location_tracker_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  await Get.putAsync(() => FirebaseMessagingController().init());
  LocationTracker.init();
  runApp(const BionicApp());
}
