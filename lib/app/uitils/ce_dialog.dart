import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DCAmountTextInputFormatter extends TextInputFormatter {
  final RegExp _exp = RegExp(r'^\d{0,5}(\.\d{0,1})?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_exp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class DCDialog extends StatelessWidget {
  final String title;
  final String contentStr;
  final Function() okAction;
  final Function()? cancleAction;
  const DCDialog(
      {super.key,
      this.cancleAction,
      required this.okAction,
      required this.title,
      required this.contentStr});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: DContainer(
            radius: 10.w,
            width: 300.w,
            height: 200.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                DCText(title, fontSize: 14),
                13.verticalSpace,
                DCText(contentStr),
                20.verticalSpace,
                Divider(
                  color: DCColorTool.dcColor("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: DCText("Cancel",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      DContainer(
                        height: 30.h,
                        width: 1,
                        color: DCColorTool.dcColor("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: okAction,
                            child: Container(
                              alignment: Alignment.center,
                              child: DCText("Confirm",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}

