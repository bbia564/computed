import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:dcoration_calculation/app/uitils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget DCinputView(
    {required String title,
    TextEditingController? controller,
    TextAlign textAliment = TextAlign.center}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      DCText(
        title,
        fontSize: 14,
      ),
      10.verticalSpace,
      DContainer(
          radius: 4.w,
          height: 50.h,
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          borderColor: DCColorTool.dcColor("#E2E2E2"),
          child: TextField(
              controller: controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                DCAmountTextInputFormatter(),
              ],
              textAlign: textAliment,
              maxLength: 7,
              style: TextStyle(
                  color: DCColorTool.mainBlue,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: 'input',
                  hintStyle: TextStyle(
                      color: DCColorTool.dcColor('#8C8C8C'),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal)),
              onChanged: (value) {}))
    ],
  );
}

Widget DCRowInputView(
    {required String title,
    required String rightTitle,
    TextEditingController? controller,
    TextAlign textAliment = TextAlign.center}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DCText(
          title,
          fontSize: 14,
        ),
        10.verticalSpace,
        DContainer(
            radius: 4.w,
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(16.w, 0, 10.w, 0),
            borderColor: DCColorTool.dcColor("#E2E2E2"),
            child: Row(
              
              children: [
                Expanded(
                    child: TextField(
                  controller: controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    DCAmountTextInputFormatter(),
                  ],
                  textAlign: textAliment,
                  maxLength: 7,
                  style: TextStyle(
                      color: DCColorTool.mainBlue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: 'input',
                      hintStyle: TextStyle(
                          color: DCColorTool.dcColor('#8C8C8C'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal)),
                )),
                5.horizontalSpace,
                DCText(rightTitle, fontSize: 14)
              ],
            ))
      ]);
}
