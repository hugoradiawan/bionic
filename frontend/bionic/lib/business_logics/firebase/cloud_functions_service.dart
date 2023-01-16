import 'package:bionic/business_logics/firebase/firebase_messaging_controller.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';

class CloudFunctionService extends GetConnect {
  final FirebaseFunctions firebaseFunctions =
      FirebaseFunctions.instanceFor(region: "asia-southeast2");

  Future<void> sendNotif() async {
    if (Get.find<FirebaseMessagingController>().fcmToken.value != null) {
      final temp = <String, dynamic>{
        'fcm': Get.find<FirebaseMessagingController>().fcmToken.value,
        'title': "test title",
        'body': "test body",
      };
      Future.delayed(const Duration(seconds: 5), () async {
        await firebaseFunctions.httpsCallable('message').call(temp);
        print('sent');
      });
    } else {
      print('fcm Error');
    }
  }
}
