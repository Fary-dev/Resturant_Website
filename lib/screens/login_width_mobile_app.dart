import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Exeptions/exeptionsFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MobileApp extends StatelessWidget {
   MobileApp({Key? key}) : super(key: key);
final _globalKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: context.height*0.6,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'Images/welcome.svg',
                  height: context.height*0.2,
                ),
                'Welcome to ${RESTURANT_NAME}'.toLabel(fontSize: 20),
                CustomTextField(lable: 'User Name').vPadding(10),
                CustomTextField(
                  lable: 'Password',
                  obscureText: true,
                ).vPadding(10),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ).hPadding(15).center,
      bottomSheet: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            title: 'Login',
            onTap: () => print('Clicked'),
            radius: 10,
            padding: 5,
            icon: Icons.vpn_key_rounded,
          ),
          CustomButton(
            title: 'SignUp',
            onTap: () => print('Clicked'),
            radius: 10,
            padding: 5,
            borderWidth: 2,
            color: Color(0xffffffff),
            icon: Icons.edit,
          ),
        ],
      ).vPadding(40).hPadding(15),
    );
  }
}
