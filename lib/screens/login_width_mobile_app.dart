// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Exeptions/extensionFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MobileApp extends StatelessWidget {
  MobileApp({Key? key}) : super(key: key);
  final _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: context.height * 0.6,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'Images/welcome.svg',
                  height: context.height * 0.2,
                ),
                'Welcome to $RESTURANT_NAME'.toLabel(fontSize: 20),
                const MTextField(lable: 'User Name').vPadding(10),
                const MTextField(
                  lable: 'Password',
                  obscureText: true,
                ).vPadding(10),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ).hPadding(15).center,
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MButton(
            title: 'Login',
            onTap: () => print('Clicked'),
            radius: 10,
            padding: 5,
            icon: Icons.vpn_key_rounded,
          ),
          MButton(
            title: 'SignUp',
            onTap: () => print('Clicked'),
            radius: 10,
            padding: 5,
            borderWidth: 2,
            color: const Color(0xffffffff),
            icon: Icons.edit,
          ),
        ],
      ).vPadding(40).hPadding(15),
    );
  }
}
