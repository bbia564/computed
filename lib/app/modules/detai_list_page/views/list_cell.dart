import 'package:dcoration_calculation/app/uitils/app_util.dart';
import 'package:dcoration_calculation/app/uitils/caculate_record_model.dart';
import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCell extends StatelessWidget {
  final DCCaculateModel model;
  const ListCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return DContainer(
        radius: 6.w,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                DCText(
                  model.type ?? "-",
                ),
                const Spacer(),
                DCText("Num：${model.countStr}",
                    fontSize: 14, fontWeight: FontWeight.w400),
              ],
            ),
            6.verticalSpace,
            Row(
              children: [
                DCText(
                    DCAppUtil.formatDateWithoutHour(
                        dateTime: DateTime.fromMillisecondsSinceEpoch(
                            model.createTime ?? 0)),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: DCColorTool.dcColor("#A0A0A0")),
                const Spacer(),
                DCText("Price：${model.amount?.toStringAsFixed(2)}",
                    textColor: DCColorTool.mainBlue),
              ],
            ),
          ],
        ));
  }
}
