import 'package:dcoration_calculation/app/modules/caculate_page/views/coating_view.dart';
import 'package:dcoration_calculation/app/modules/caculate_page/views/floor_tile_view.dart';
import 'package:dcoration_calculation/app/modules/caculate_page/views/wall_paper_view.dart';
import 'package:dcoration_calculation/app/uitils/base_view.dart';
import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/caculate_page_controller.dart';

class CaculatePageView extends PSBaseView<CaculatePageController> {
  const CaculatePageView({super.key});

  @override
  String appbarTile() {
    return "Decoration calculation";
  }

  @override
  Widget contentViewBuild(BuildContext context) {
    const wallpaperView = WallPaperView();
    const floorTileView = FloorTileView();
    const coatingView = CoatingView();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: DContainer(
          radius: 10.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              controller.type.value = 0;
                            },
                            child: Obx(() => Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: DCText("Wall-Paper",
                                      fontWeight: controller.type.value == 0
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                      textColor: controller.type.value == 0
                                          ? DCColorTool.dcColor("#000000")
                                          : DCColorTool.dcColor("#888888")),
                                )),
                          )),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                controller.type.value = 1;
                              },
                              child: Obx(() => Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: DCText("Floor-tile",
                                      fontWeight: controller.type.value == 1
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                      textColor: controller.type.value == 1
                                          ? DCColorTool.dcColor("#000000")
                                          : DCColorTool.dcColor(
                                              "#888888")))))),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                controller.type.value = 2;
                              },
                              child: Obx(() => Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: DCText("Coating",
                                      fontWeight: controller.type.value == 2
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                      textColor: controller.type.value == 2
                                          ? DCColorTool.dcColor("#000000")
                                          : DCColorTool.dcColor(
                                              "#888888")))))),
                    ],
                  )),
              SizedBox(
                height: 2.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Flexible(
                        child: Obx(() => DContainer(
                            height: controller.type.value == 0 ? 2 : 1,
                            color: controller.type.value == 0
                                ? DCColorTool.mainBlue
                                : DCColorTool.dcColor("#F4F4F4")))),
                    Flexible(
                        child: Obx(() => DContainer(
                            height: controller.type.value == 1 ? 2 : 1,
                            color: controller.type.value == 1
                                ? DCColorTool.mainBlue
                                : DCColorTool.dcColor("#F4F4F4")))),
                    Flexible(
                        child: Obx(() => DContainer(
                            height: controller.type.value == 2 ? 2 : 1,
                            color: controller.type.value == 2
                                ? DCColorTool.mainBlue
                                : DCColorTool.dcColor("#F4F4F4"))))
                  ],
                ),
              ),
              10.verticalSpace,
              Obx(() {
                if (controller.type.value == 0) {
                  return wallpaperView;
                } else if (controller.type.value == 1) {
                  return floorTileView;
                }
                return coatingView;
              }),
              5.verticalSpace,
              InkWell(
                onTap: controller.beginCaculate,
                child: DContainer(
                    radius: 6.w,
                    height: 42.h,
                    color: DCColorTool.mainBlue,
                    alignment: Alignment.center,
                    child: DCText("Caculate", textColor: Colors.white)),
              ),
              10.verticalSpace,
              DContainer(
                  radius: 10.w,
                  // width: double.infinity,
                  color: DCColorTool.dcColor("#EAF2FA"),
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DCText("Result"),
                      12.verticalSpace,
                      DCDivider(),
                      Obx(() => controller.hasResult.isTrue
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                14.verticalSpace,
                                Obx(() => DCText(controller.resulStr.value,
                                    fontSize: 20)),
                                2.verticalSpace,
                                Obx(() => DCText(
                                    controller.resulSubStr.value,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor:
                                        DCColorTool.dcColor("#999999"))),
                                18.verticalSpace,
                                Obx(() => DCText(
                                    controller.resulPriceStr.value,
                                    fontSize: 20)),
                                2.verticalSpace,
                                Obx(() => DCText(
                                    controller.resulPriceSubStr.value,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    textColor:
                                        DCColorTool.dcColor("#999999"))),
                                6.verticalSpace
                              ],
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: DCText("no result",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor: DCColorTool.dcColor("#999999")),
                            ))
                    ],
                  )),
              22.verticalSpace,
            ],
          )),
    );
  }
}
