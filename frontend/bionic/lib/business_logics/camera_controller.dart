import 'package:camera/camera.dart';
import 'package:get/get.dart';

class GetCameraController extends GetxController {
  final Rxn<CameraController> cameraController = Rxn<CameraController>();
  late List<CameraDescription> _cameras;
  final Rxn<CameraImage> cameraImage = Rxn<CameraImage>();
  final RxBool isBusy = false.obs;
  final RxDouble scale = Get.size.aspectRatio.obs;
  final RxInt _selectedCameraIndex = 0.obs;

  void switchCamera() {
    _selectedCameraIndex.value =
        (_selectedCameraIndex.value + 1) % _cameras.length;
  }

  @override
  Future<void> onReady() async {
    _cameras = await availableCameras();
    cameraController.value = CameraController(
      _cameras[_selectedCameraIndex.value],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
      enableAudio: false,
    );
    _selectedCameraIndex.listen((index) {
      cameraController.value = CameraController(
        _cameras[index],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
        enableAudio: false,
      );
    });

    cameraController.listen((value) async {
      if (value != null) {
        if (!(value.value.isInitialized)) {
          await value.initialize();
          await value.startImageStream(cameraImage);
          cameraController.refresh();
        }
        double result = Get.size.aspectRatio * value.value.aspectRatio;
        if (result < 1) result = 1 / result;

        scale.value = result;
      }
    });
    super.onReady();
    cameraController.refresh();
  }
}
