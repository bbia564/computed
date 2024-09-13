import 'package:get/get.dart';

import '../controllers/setttings_page_controller.dart';

class SetttingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetttingsPageController>(
      () => SetttingsPageController(),
    );
  }
}
