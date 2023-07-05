import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:team_project/src/presentation/model/controller/model_controller.dart';

class ModelScreen extends StatelessWidget {
  const ModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModelController>(
      builder: (ctr) {
        return ModalProgressHUD(
          inAsyncCall: ctr.isLoading,
          child: Scaffold(
            appBar: AppBar(),
            body: SizedBox(
              height: Get.height - 56,
              width: Get.width,
              child: ModelViewer(
                src:
                    'assets/3d/${Get.arguments is String ? (Get.arguments as String) : 'Human_eye'}.glb',
                ar: true,
                autoPlay: true,
                autoRotate: true,
                cameraControls: true,
                loading: Loading.eager,
              ),
            ),
          ),
        );
      },
    );
  }
}
