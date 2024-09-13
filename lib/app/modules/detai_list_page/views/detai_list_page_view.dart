import 'package:dcoration_calculation/app/modules/detai_list_page/views/list_cell.dart';
import 'package:dcoration_calculation/app/uitils/base_view.dart';
import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/detai_list_page_controller.dart';

class DetaiListPageView extends PSBaseView<DetaiListPageController> {
  const DetaiListPageView({super.key});

  @override
  DetaiListPageController get controller => Get.put(DetaiListPageController());

  @override
  String appbarTile() {
    return "Details";
  }

  @override
  Widget contentViewBuild(BuildContext context) {
    return Obx(() => controller.alldatas.isEmpty
        ? Center(
            child: DCText("no data yet",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textColor: DCColorTool.dcColor("#999999")),
          )
        : ListView.builder(
            itemCount: controller.alldatas.length,
            padding: EdgeInsets.all(16.w),
            itemBuilder: (context, index) {
              final model = controller.alldatas[index];
              return ListCell(model: model);
            },
          ));
  }
}
