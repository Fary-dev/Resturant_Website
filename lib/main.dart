import 'dart:async';

import 'package:flutter/material.dart';
import 'Constant/constant.dart';
import 'Providers/api_provider.dart';
import 'screens/home_Screen.dart';
import 'screens/login_width_web.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'screens/onBurding_screen.dart';

void main() {
  initialize();
  runApp(const MyApp());
}

void initialize() {
  // inject authentication controller
  Get.lazyPut(
    () => AuthenticationController(),
  );
}

class MyApp extends GetWidget<AuthenticationController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodo ',
      theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(color: primaryColor)
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      home: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.macOS
          ? OnburdingScreen()
          : Obx(
              () => controller.state is UnAuthenticated
                  ? LoginWeb()
                  : controller.state is Authenticated
                      ? HomeScreen()
                      : CircularProgressIndicator(),
            ),
      // :?LoginWeb():HomeScreen(),
    );
  }
}
