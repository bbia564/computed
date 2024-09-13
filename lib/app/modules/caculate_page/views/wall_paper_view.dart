import 'package:dcoration_calculation/app/modules/caculate_page/controllers/caculate_page_controller.dart';
import 'package:dcoration_calculation/app/modules/caculate_page/views/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WallPaperView extends StatelessWidget {
  const WallPaperView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaculatePageController>();
    return Container(
      width: double.infinity,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DCinputView(
                    title: "Wall-height",
                    controller: controller.wallpaper_wallHieghtControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Wall-width",
                      controller: controller.wallpaper_wallWidthControl)),
            ],
          ),
          16.verticalSpace,
          DCinputView(
              title: "Wall-num",
              controller: controller.wallpaper_wallCountControl),
          16.verticalSpace,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DCRowInputView(
                    title: "Paper-size",
                    rightTitle: "/m²",
                    controller: controller.wallpaper_wallSizeControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Paper-price",
                      textAliment: TextAlign.left,
                      controller: controller.wallpaper_wallPriceControl)),
            ],
          ),
          15.verticalSpace
        ],
      ),
    );
  }
}
