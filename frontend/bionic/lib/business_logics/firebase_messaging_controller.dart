import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FirebaseMessagingController extends GetxController {
  late FirebaseMessaging _messaging;
  late RxnString fcmToken;

  Future<String?> getToken() async {
    if (fcmToken.value != null) return fcmToken.value;
    final String? newToken = await _messaging.getToken();
    await saveToLocal(newToken);
    _messaging.onTokenRefresh.listen(saveToLocal);
    return fcmToken.value;
  }

  Future<FirebaseMessagingController> init() async {
    _messaging = FirebaseMessaging.instance;
    await _messaging.setAutoInitEnabled(false);
    FirebaseMessaging.onMessage.listen((message) async {});
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {});
    return this;
  }

  void deleteToken() => _messaging.deleteToken();

  Future<void> saveToLocal(String? token) async {
    if (token != null) {
      fcmToken.value = token;
      await GetStorage().write('fcmToken', token);
    }
  }

  void printFcmToken() {
    log(fcmToken.toString());
  }

  @override
  void onInit() {
    fcmToken = RxnString(GetStorage().read<String>('fcmToken'));
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getToken();
    super.onReady();
  }

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
