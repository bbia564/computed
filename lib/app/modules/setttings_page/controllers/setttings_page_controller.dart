import 'package:bot_toast/bot_toast.dart';
import 'package:dcoration_calculation/app/modules/detai_list_page/controllers/detai_list_page_controller.dart';
import 'package:dcoration_calculation/app/uitils/ce_dialog.dart';
import 'package:dcoration_calculation/app/uitils/dc_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetttingsPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cellOnpressed(int index) {
    if (index == 1) {
      showclearAleart();
    } else {
      showVersionAleart();
    }
  }

  void showclearAleart() {
    Get.dialog(Center(
      child: DCDialog(
        title: "Tips",
        contentStr: "Are you sure to clear all records",
        okAction: cleanDatas,
      ),
    ));
  }

  void showVersionAleart() {
    Get.dialog(Center(
      child: DCDialog(
        title: "Version",
        contentStr: "V1.0.0",
        okAction: Get.back,
      ),
    ));
  }

  void cleanDatas() async {
    Get.back();
    await DCDatabaseUtil().clean();
    if (Get.isRegistered<DetaiListPageController>()) {
      Get.find<DetaiListPageController>().refresh();
    }
    BotToast.showText(text: "Clear Success");
  }
}
