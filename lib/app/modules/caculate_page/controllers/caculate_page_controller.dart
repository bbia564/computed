import 'package:bot_toast/bot_toast.dart';
import 'package:dcoration_calculation/app/modules/detai_list_page/controllers/detai_list_page_controller.dart';
import 'package:dcoration_calculation/app/uitils/caculate_record_model.dart';
import 'package:dcoration_calculation/app/uitils/dc_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaculatePageController extends GetxController {
  final wallpaper_wallHieghtControl = TextEditingController(text: "0");
  final wallpaper_wallWidthControl = TextEditingController(text: "0");
  final wallpaper_wallCountControl = TextEditingController(text: "0");
  final wallpaper_wallSizeControl = TextEditingController(text: "0");
  final wallpaper_wallPriceControl = TextEditingController(text: "0");

  final floor_floorHieghtControl = TextEditingController(text: "0");
  final floor_floorWidthControl = TextEditingController(text: "0");
  final floor_gapHieghtControl = TextEditingController(text: "0");
  final floor_gapWidthControl = TextEditingController(text: "0");
  final floor_tileHieghtControl = TextEditingController(text: "0");
  final floor_tileWidthControl = TextEditingController(text: "0");
  final floor_floorPriceControl = TextEditingController(text: "0");

  final coating_wallHieghtControl = TextEditingController(text: "0");
  final coating_wallWidthControl = TextEditingController(text: "0");
  final coating_CountControl = TextEditingController(text: "0");
  final coating_coatingPriceControl = TextEditingController(text: "0");

  final type = 0.obs;
  final resulStr = "".obs;
  final resulSubStr = "".obs;

  final resulPriceStr = "".obs;
  final resulPriceSubStr = "".obs;
  final hasResult = false.obs;

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
    disposiControlls();
  }

  void disposiControlls() {
    wallpaper_wallWidthControl.dispose();
    wallpaper_wallHieghtControl.dispose();
    wallpaper_wallCountControl.dispose();
    wallpaper_wallSizeControl.dispose();
    wallpaper_wallPriceControl.dispose();

    floor_floorHieghtControl.dispose();
    floor_floorWidthControl.dispose();
    floor_gapHieghtControl.dispose();
    floor_gapWidthControl.dispose();
    floor_tileHieghtControl.dispose();
    floor_tileWidthControl.dispose();
    floor_floorPriceControl.dispose();

    coating_wallHieghtControl.dispose();
    coating_wallWidthControl.dispose();
    coating_CountControl.dispose();
    coating_coatingPriceControl.dispose();
  }

  void beginCaculate() {
    if (type.value == 2) {
      cacaulate_coating();
    } else if (type.value == 1) {
      cacaulate_floor();
    } else {
      cacaulate_paper();
    }
  }

  void cacaulate_floor() {
    if (floor_floorHieghtControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the ground width");
      return;
    }
    if (floor_floorWidthControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the ground length");
      return;
    }
    if (floor_gapHieghtControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the width of brick seam");
      return;
    }
    if (floor_gapWidthControl.text.isEmpty) {
      BotToast.showText(text: "Please input brick seam length");
      return;
    }

    if (floor_tileHieghtControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the floor tile width");
      return;
    }

    if (floor_tileWidthControl.text.isEmpty) {
      BotToast.showText(text: "Please enter length of tile");
      return;
    }

    if (floor_floorPriceControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the floor tile price");
      return;
    }

    try {
      final height = double.parse(floor_floorHieghtControl.text);
      final width = double.parse(floor_floorWidthControl.text);

      final gapheight = double.parse(floor_gapHieghtControl.text);
      final gapwidth = double.parse(floor_gapWidthControl.text);

      final tileheight = double.parse(floor_tileHieghtControl.text);
      final tilewidth = double.parse(floor_floorPriceControl.text);

      final price = double.parse(floor_floorPriceControl.text);

      if (height <= 0.0 ||
          width <= 0.0 ||
          gapheight <= 0.0 ||
          gapwidth <= 0.0 ||
          tileheight <= 0.0 ||
          tilewidth <= 0.0 ||
          price <= 0.0) {
        BotToast.showText(text: "The entered number cannot be 0");
        return;
      }

      final totalSize =
          (height * width) / (gapheight + tileheight) / (gapwidth + tilewidth);
      final totalPrice = totalSize * price;
      resulStr.value = "${totalSize.toInt()}/piece";
      resulSubStr.value = "The number of floor tiles you need";

      resulPriceStr.value = totalPrice.toStringAsFixed(2);
      resulPriceSubStr.value = "The total price of the floor tiles you need";

      hasResult.value = true;

      addNewRecord(
          type: "floor-tile", countStr: resulStr.value, totalPrice: totalPrice);
    } catch (e) {
      BotToast.showText(text: "Input error, please check");
    }
  }

  void cacaulate_coating() {
    if (coating_wallHieghtControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the wall width");
      return;
    }
    if (coating_wallWidthControl.text.isEmpty) {
      BotToast.showText(text: "Please enter wall length");
      return;
    }
    if (coating_CountControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the amount of paint");
      return;
    }
    if (coating_coatingPriceControl.text.isEmpty) {
      BotToast.showText(text: "Please enter paint price");
      return;
    }

    try {
     
      final height = double.parse(coating_wallHieghtControl.text);
      final width = double.parse(coating_wallWidthControl.text);
      final count = double.parse(coating_CountControl.text);
      final price = double.parse(coating_coatingPriceControl.text);

      final totalSize = height * width * count;
      final totalPrice = totalSize * price;

      if (height <= 0.0 || width <= 0.0 || count <= 0.0 || price <= 0.0) {
        BotToast.showText(text: "The entered number cannot be 0");
        return;
      }

      resulStr.value = "${totalSize.toStringAsFixed(1)}/kg";
      resulSubStr.value = "The coating you need";

      resulPriceStr.value = totalPrice.toStringAsFixed(2);
      resulPriceSubStr.value = "The total price of the coating you need";

      hasResult.value = true;

      addNewRecord(
          type: "coating", countStr: resulStr.value, totalPrice: totalPrice);
    } catch (e) {
      BotToast.showText(text: "Input error, please check");
    }
  }

  void cacaulate_paper() {
    if (wallpaper_wallHieghtControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the wall lenght");
      return;
    }
    if (wallpaper_wallWidthControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the wall height");
      return;
    }
    if (wallpaper_wallCountControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the number of walls");
      return;
    }
    if (wallpaper_wallSizeControl.text.isEmpty) {
      BotToast.showText(text: "Please enter the wallpaper size");
      return;
    }
    if (wallpaper_wallPriceControl.text.isEmpty) {
      BotToast.showText(text: "Please enter wallpaper price");
      return;
    }

    try {
      final height = double.parse(wallpaper_wallHieghtControl.text);
      final width = double.parse(wallpaper_wallWidthControl.text);
      final count = double.parse(wallpaper_wallCountControl.text);
      final size = double.parse(wallpaper_wallSizeControl.text);
      final price = double.parse(wallpaper_wallPriceControl.text);

      if (height <= 0.0 ||
          width <= 0.0 ||
          count <= 0.0 ||
          size <= 0.0 ||
          price <= 0.0 ||
          price <= 0.0) {
        BotToast.showText(text: "The entered number cannot be 0");
        return;
      }

      final totalSize = height * width * count;
      final totalPrice = totalSize * price / size;
      resulStr.value = "${totalSize.toStringAsFixed(1)}/㎡";
      resulSubStr.value = "The number of wallpapers you need";

      resulPriceStr.value = "${totalPrice.toStringAsFixed(2)}";
      resulPriceSubStr.value = "The total price of the wallpaper you need";

      hasResult.value = true;

      addNewRecord(
          type: "Wall-paper", countStr: resulStr.value, totalPrice: totalPrice);
    } catch (e) {
      BotToast.showText(text: "Input error, please check");
    }
  }

  void addNewRecord(
      {required String type,
      required String countStr,
      required double totalPrice}) async {
    final newmodel = DCCaculateModel();
    newmodel.type = type;
    newmodel.countStr = countStr;
    newmodel.amount = totalPrice;
    newmodel.createTime = DateTime.now().millisecondsSinceEpoch;

    await DCDatabaseUtil().insetPetManagerRecord(newmodel);

    if (Get.isRegistered<DetaiListPageController>()) {
      Get.find<DetaiListPageController>().refreshDatas();
    }
  }
}
