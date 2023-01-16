import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermissionRequestDialog extends StatelessWidget {
  final Color color;
  final int font;
  final VoidCallback onDenied;
  final VoidCallback onGranted;
  const PermissionRequestDialog(
      this.color, this.font, this.onDenied, this.onGranted,
      {Key? key})
      : super(key: key);
  @override
  Widget build(_) => Dialog(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
            alignment: Alignment.center,
            width: Get.width * 0.8,
            height: Get.height / 4,
            child: Flex(direction: Axis.vertical, children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Kami membutuhkan lokasi terkini untuk mempermudah pencarian alamat tujuan',
                      maxLines: 2,
                      style: TextStyle(color: color, fontSize: 200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    child: InkWell(
                      onTap: onDenied,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Text(
                          'Izinkan lain waktu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 200,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onGranted,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Text(
                          'izinkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 200,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      );
}
