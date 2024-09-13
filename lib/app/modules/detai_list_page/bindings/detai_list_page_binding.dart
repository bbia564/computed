import 'package:get/get.dart';

import '../controllers/detai_list_page_controller.dart';

class DetaiListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetaiListPageController>(
      () => DetaiListPageController(),
    );
  }
}
