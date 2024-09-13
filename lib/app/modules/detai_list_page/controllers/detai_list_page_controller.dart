import 'package:dcoration_calculation/app/uitils/caculate_record_model.dart';
import 'package:dcoration_calculation/app/uitils/dc_database.dart';
import 'package:get/get.dart';

class DetaiListPageController extends GetxController {
  final alldatas = <DCCaculateModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    refreshDatas();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void refreshDatas() async {
    alldatas.value = await DCDatabaseUtil().getAllRecords();
  }
}
