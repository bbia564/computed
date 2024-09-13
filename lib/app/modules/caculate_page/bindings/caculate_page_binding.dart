import 'package:get/get.dart';

import '../controllers/caculate_page_controller.dart';

class CaculatePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CaculatePageController>(
      () => CaculatePageController(),
    );
  }
}
