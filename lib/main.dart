import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dcoration_calculation/app/uitils/app_util.dart';
import 'package:dcoration_calculation/app/uitils/color_tool.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/modules/cacu_get/get_binding.dart';
import 'app/modules/cacu_get/get_view.dart';
import 'app/modules/caculate_page/bindings/caculate_page_binding.dart';
import 'app/modules/caculate_page/views/caculate_page_view.dart';
import 'app/modules/detai_list_page/bindings/detai_list_page_binding.dart';
import 'app/modules/detai_list_page/views/detai_list_page_view.dart';
import 'app/modules/home/bindings/home_binding.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/setttings_page/bindings/setttings_page_binding.dart';
import 'app/modules/setttings_page/views/setttings_page_view.dart';
import 'app/uitils/get_com.dart';

void main() {
  runApp(_initApp());
}

Widget ceInitGetMaterialApp({
  Widget Function(BuildContext, Widget?)? builder,
}) {
  return GetMaterialApp(
    darkTheme: ThemeData.dark(),
    useInheritedMediaQuery: true,
    themeMode: ThemeMode.light,
    fallbackLocale: const Locale('en', 'US'),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: RootPages,
    defaultTransition: Transition.rightToLeft,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        indicatorColor: Colors.grey,
        brightness: Brightness.light,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.white.withOpacity(0),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: DCColorTool.dcColor("#0F0F0F")),
          systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white)),
    builder: builder,
    navigatorObservers: [BotToastNavigatorObserver()],
    supportedLocales: const [
      Locale('zh', 'CN'),
      Locale('en', 'US'),
    ],
    localizationsDelegates: const [
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  );
}

_initApp() {
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  _setBotToast();

  Widget body = ceInitGetMaterialApp(
    builder: (context, child) {
      final botToastBuilder = BotToastInit();

      return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (p0, p1) {
          Widget body = GestureDetector(
            onTap: () {
              DCAppUtil.keyboardDis(context);
            },
            child: child,
          );
          body = botToastBuilder(context, body);
          return body;
        },
      );
    },
  );
  return body;
}

void _setBotToast() {
  BotToast.defaultOption.notification.animationDuration =
      const Duration(seconds: 2);
}
List<GetPage<dynamic>> RootPages = [
  GetPage(
    name: '/',
    page: () => const GetPulrView(),
    binding: GetPlurBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/gam',
    page: () => const GCom(),
  ),
  GetPage(
    name: '/caculate-page',
    page: () => const CaculatePageView(),
    binding: CaculatePageBinding(),
  ),
  GetPage(
    name: '/detai-list-page',
    page: () => const DetaiListPageView(),
    binding: DetaiListPageBinding(),
  ),
  GetPage(
    name: '/setttings-page',
    page: () => const SetttingsPageView(),
    binding: SetttingsPageBinding(),
  ),
];