import 'package:bionic/business_logics/firebase/cloud_functions_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(_) => Center(
        child: ElevatedButton(
          onPressed: () {
            Get.find<CloudFunctionService>().sendNotif();
          },
          child: const Text('Send Notif in the next 5 second'),
        ),
      );
}
