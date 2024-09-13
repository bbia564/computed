import 'dart:math';

import 'package:dcoration_calculation/app/modules/detai_list_page/controllers/detai_list_page_controller.dart';
import 'package:dcoration_calculation/app/uitils/caculate_record_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DCDatabaseUtil extends GetxService {
  late Database db;
  String lastTime = "";
  Future<DCDatabaseUtil> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dc_db.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });
    await insetinitailmodel();
  }

  Future<void> insetinitailmodel() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final count = 7 + Random().nextInt(6);
    for (var i = 0; i < count; i++) {
      final newmodel = DCCaculateModel();
      newmodel.type = "coating";
      newmodel.countStr = "${1 + Random().nextInt(50)}/kg";
      newmodel.amount = (569 + Random().nextInt(1289)) + Random().nextDouble();
      newmodel.createTime = DateTime.now().millisecondsSinceEpoch;

      await DCDatabaseUtil().insetPetManagerRecord(newmodel);
    }
    if (Get.isRegistered<DetaiListPageController>()) {
      Get.find<DetaiListPageController>().refreshDatas();
    }
  }

  Future<void> createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS caculate_record_table (id INTEGER PRIMARY KEY AUTOINCREMENT, createTime INT,  type TEXT ,countStr TEXT, amount DOUBLE(10, 2) )');
  }

  Future<void> insetPetManagerRecord(DCCaculateModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dc_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});

    await db.insert('caculate_record_table', {
      'type': item.type,
      'amount': item.amount,
      'countStr': item.countStr,
      'createTime': item.createTime,
    });

  }

  update(DCCaculateModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dc_db.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.update(
        'caculate_record_table',
        {
          'type': item.type,
          'amount': item.amount,
          'countStr': item.countStr,
          'createTime': item.createTime,
        },
        where: 'id = ?',
        whereArgs: [
          item.id,
        ]);
  }

  Future<void> clean() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dc_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.delete('caculate_record_table');
  }

  Future<List<DCCaculateModel>> getAllRecords() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dc_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('caculate_record_table', orderBy: 'id DESC');
    return result.map((e) => DCCaculateModel.fromJson(e)).toList();
  }
}
