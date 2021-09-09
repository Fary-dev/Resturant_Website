import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Exeptions/exeptionsFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'home_Screen.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:Container(
        width: context.width*0.3<350?350:context.width*0.3,
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'Images/welcome.svg',
                height: 100,
              ),
              'Welcome to your ${RESTURANT_NAME}'.toLabel(fontSize: 20,bold: true).vPadding(20),
              CustomTextField(lable: 'User Name'),
              CustomTextField(lable: 'Password',obscureText: true,).vPadding(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    title: 'Login',
                    onTap: () => context.pageRoute(HomeScreen()),
                    radius: 10,
                    padding: 15,
                    icon: Icons.vpn_key_rounded,
                  ),
                  CustomButton(
                    title: 'SignUp',
                    onTap: () => print('Clicked'),
                    radius: 10,
                    padding: 15,
                    borderWidth: 1,
                    color: Color(0xffffffff),
                    icon: Icons.edit,
                  ).vPadding(10),
                ],
              ).vPadding(20),
            ],
          ),
        ).aPadding(20),
      ).center,
    );
  }
}
