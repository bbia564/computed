import 'package:dcoration_calculation/app/modules/caculate_page/views/caculate_page_view.dart';
import 'package:dcoration_calculation/app/modules/detai_list_page/views/detai_list_page_view.dart';
import 'package:dcoration_calculation/app/modules/setttings_page/views/setttings_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    const CaculatePageView(),
    const DetaiListPageView(),
    const SetttingsPageView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // PMDBTool().init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }


}

