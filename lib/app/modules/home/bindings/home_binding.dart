import 'package:dcoration_calculation/app/modules/caculate_page/controllers/caculate_page_controller.dart';
import 'package:dcoration_calculation/app/modules/detai_list_page/controllers/detai_list_page_controller.dart';
import 'package:dcoration_calculation/app/modules/setttings_page/controllers/setttings_page_controller.dart';
import 'package:dcoration_calculation/app/uitils/dc_database.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DCDatabaseUtil().init();
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
     Get.lazyPut<CaculatePageController>(
      () => CaculatePageController(),
    );

     Get.lazyPut<DetaiListPageController>(
      () => DetaiListPageController(),
    );
     Get.lazyPut<SetttingsPageController>(
      () => SetttingsPageController(),
    );
  }
}
