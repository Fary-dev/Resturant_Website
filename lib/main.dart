import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_with_Web.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'Bloc/state_bloc.dart';
import 'Bloc/user_bloc.dart';
import 'Constant/constant.dart';
import 'Services/service.dart';
import 'screens/home/home.dart';
import 'screens/onBurding_screen.dart';

void main() {
  initialize();
  runApp(
    MyApp(),
  );

}

void initialize() {
  Get.lazyPut(() => UserBloc(Get.put(FakeAuthenticationService())));
}

class MyApp extends GetWidget<UserBloc> {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodo ',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xffffffff)),
        primaryColor: primaryColor,
        dividerTheme: DividerThemeData(
          color: Color(0xffA7B1B7),
        ),
        appBarTheme: const AppBarTheme(color: primaryColor),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xff000000),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData(
        iconTheme: IconThemeData(color: Color(0xff000000)),

        primaryColor: primaryColor,
        dividerTheme: DividerThemeData(
          color: Color(0xffA7B1B7),
        ),
        appBarTheme: const AppBarTheme(color: primaryColor),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xffffffff),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS
          ? OnburdingScreen()
          : Obx(
              () {
                if (controller.state is Authenticated)
                  return HomePage(
                    user: (controller.state as Authenticated).user,
                  );
                else
                  return Login();
              },
            ),
    );
  }
}
