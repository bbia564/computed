import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

abstract class PSBaseView<T extends GetxController> extends GetView<T> {
  const PSBaseView({super.key});

  Widget _buildBgView() {
    return DContainer(
        width: 1.sw,
        height: 1.sh,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [DCColorTool.dcColor("#E4EAF5"), Colors.white]));
  }

  bool showTitleView() {
    return false;
  }

  String appbarTile();
  Widget contentViewBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: DCText(appbarTile()),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _buildBgView(),
            Positioned(
              top: kMinInteractiveDimension + MediaQuery.of(context).padding.top,
              bottom: 0,
              right: 0,
              left: 0,
              child: contentViewBuild(context),
            ),
          ],
        ));
  }
}
