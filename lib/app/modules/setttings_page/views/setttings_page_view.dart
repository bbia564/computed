import 'package:dcoration_calculation/app/assets/assets.dart';
import 'package:dcoration_calculation/app/uitils/base_view.dart';
import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/setttings_page_controller.dart';

class SetttingsPageView extends PSBaseView<SetttingsPageController> {
  const SetttingsPageView({super.key});

  @override
  String appbarTile() {
    return "Settings";
  }

  @override
  Widget contentViewBuild(BuildContext context) {
    final titles = ["About", "Clear"];
    return Column(
      children: [
        DContainer(
            radius: 10.w,
            padding: EdgeInsets.symmetric(horizontal:  16.w,vertical: 6.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
                itemBuilder: (context, index) {
                  final title = titles[index];
                  return SizedBox(
                    height: 44.h,
                    child: InkWell(
                      onTap: () {
                        controller.cellOnpressed(index);
                      },
                      child: Row(
                      children: [
                        DCText(title,
                            textColor: index == 3
                                ? DCColorTool.mainBlue
                                : Colors.black,
                            fontSize: 14,
                            fontWeight:
                                index == 3 ? FontWeight.w600 : FontWeight.w400),
                        const Spacer(),
                        Image.asset(
                          Assets.jiantou,
                          height: 14.h,
                          width: 14.w,
                        )
                      ],
                    ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => DCDivider(),
                itemCount: titles.length))
      ],
    );
  }
}
