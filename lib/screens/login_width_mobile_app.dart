
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Exeptions/exeptionsFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ff=context.width;
    return Scaffold(
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            '$ff'.toLabel(),
            'Welcome to ${RESTURANT_NAME}'.toLabel(fontSize: 20),
            CustomTextField(lable: 'User Name').vPadding(10),
            CustomTextField(lable: 'Password',obscureText: true,).vPadding(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  title: 'SignUp',
                  onTap: () => print('Clicked'),
                  radius: 10,
                  padding: 5,
                  borderWidth: 2,
                  color: Color(0xffffffff),
                  icon: Icons.edit,
                ),
                const SizedBox(width: 20,),
                CustomButton(
                  title: 'Login',
                  onTap: () => print('Clicked'),
                  radius: 10,
                  padding: 5,
                  icon: Icons.vpn_key_rounded,
                ),
              ],
            ),
          ],
        ),
      ).center.hPadding(15),
    );
  }
}
