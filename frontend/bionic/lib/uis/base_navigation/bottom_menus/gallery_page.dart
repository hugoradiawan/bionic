import 'package:bionic/business_logics/camera_controller.dart';
import 'package:bionic/business_logics/map_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(_) => GetBuilder<LocalPhotoManager>(
        init: LocalPhotoManager(),
        builder: (lpm) => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GetX<GetCameraController>(
                init: GetCameraController(),
                builder: (sc) => sc.cameraController.value == null
                    ? Container()
                    : Transform.scale(
                        scale: sc.scale.value,
                        child: CameraPreview(sc.cameraController.value!),
                      ),
              ),
            ),
            for (int i = 0; i < lpm.constUrls.length; i++)
              Stack(alignment: Alignment.topRight, children: [
                Image.network(lpm.constUrls[i]),
                Checkbox(value: true, onChanged: (val) {}),
              ]),
          ],
        ),
      );
}
