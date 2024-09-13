import 'package:get/get.dart';

import 'get_logic.dart';

class GetPlurBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
