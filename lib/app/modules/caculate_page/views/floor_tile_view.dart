import 'package:dcoration_calculation/app/modules/caculate_page/controllers/caculate_page_controller.dart';
import 'package:dcoration_calculation/app/modules/caculate_page/views/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FloorTileView extends StatelessWidget {
  const FloorTileView({super.key});

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
                    title: "Floor lenght",
                    controller: controller.floor_floorWidthControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Floor width",
                      controller: controller.floor_floorHieghtControl)),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DCinputView(
                    title: "Gap-lenght",
                    controller: controller.floor_gapWidthControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Gap-width",
                      controller: controller.floor_gapHieghtControl)),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DCinputView(
                    title: "Tile-lenght",
                    controller: controller.floor_tileWidthControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Tile-width",
                      controller: controller.floor_tileHieghtControl)),
            ],
          ),
          16.verticalSpace,
          DCinputView(
              title: "Tile-price", controller: controller.floor_floorPriceControl),
          15.verticalSpace
        ],
      ),
    );
  }
}
