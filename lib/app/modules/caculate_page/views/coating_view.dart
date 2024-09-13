import 'package:dcoration_calculation/app/modules/caculate_page/controllers/caculate_page_controller.dart';
import 'package:dcoration_calculation/app/modules/caculate_page/views/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoatingView extends StatelessWidget {
  const CoatingView({Key? key}) : super(key: key);

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
                    title: "Wall length",
                    controller: controller.coating_wallWidthControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Wall width",
                      controller: controller.coating_wallHieghtControl)),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DCRowInputView(
                    title: "Coatings ",
                    rightTitle: "/kg",
                    controller: controller.coating_CountControl),
              ),
              10.horizontalSpace,
              Flexible(
                  flex: 1,
                  child: DCinputView(
                      title: "Coating price",
                      textAliment: TextAlign.left,
                      controller: controller.coating_coatingPriceControl)),
            ],
          ),
          15.verticalSpace
        ],
      ),
    );
  }
}
