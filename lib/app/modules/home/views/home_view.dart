import 'package:dcoration_calculation/app/assets/assets.dart';
import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: DCColorTool.mainBlue,
            unselectedLabelStyle: TextStyle(
                color: DCColorTool.dcColor("#292929"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(
                color: DCColorTool.mainBlue,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
            onTap: (value) {
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.homeNormal),
                  activeIcon: _tbTbarItem(Assets.homeSelected),
                  label: "Calculate"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.recordNormal),
                  activeIcon: _tbTbarItem(Assets.recordSelected),
                  label: "History"),
              BottomNavigationBarItem(
                label: "Settings",
                icon: _tbTbarItem(Assets.setttingsNormal),
                activeIcon: _tbTbarItem(Assets.settingsSelected),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
