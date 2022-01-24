
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/state_bloc.dart';
import 'package:flutter_app/Bloc/user_bloc.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Extension/extensionFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'login_with_Web.dart';

//ignore: must_be_immutable
class MobileApp extends StatelessWidget {
  MobileApp({Key? key}) : super(key: key);
  UserBloc controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: context.heightScreen * 0.6,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (controller.state is LodingUser) MIndicator(),
                SvgPicture.asset(
                  'images/welcome.svg',
                  height: context.heightScreen * 0.2,
                ),
                'Welcome to $RESTURANT_NAME'.toLabel(
                  textStyle: Theme.of(context).textTheme.headline1!,
                ),
                MTextField(
                  lable: 'User Name',
                  controller: mobile,
                  validator: (val) {
                    if ((val ?? '').isEmpty) return 'can not be empety';
                    return null;
                  },
                ).vPadding(10),
                MTextField(
                  lable: 'Password',
                  obscureText: true,
                  controller: pass,
                  validator: (val) {
                    if ((val ?? '').isEmpty) return 'can not be empety';
                    return null;
                  },
                ).vPadding(10),
                const SizedBox(
                  height: 20,
                ),
                if (controller.state is FaildUser)
                  MError(exception: (controller.state as FaildUser).massage)
              ],
            ),
          ),
        ),
      ).hPadding(15).center,
      bottomSheet: AbsorbPointer(
        absorbing: controller.state is LodingUser,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MButton(
              title: 'Login',
              onTap: () {
                if (_formKey.currentState!.validate())
                  controller.signIn(mobile.text, pass.text, remember);
              },
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
            MButton(
              title: 'forget my password.',
              onTap: () {
                print('forget my password');
              },
              color: const Color(0xffffffff),
              isTextButton: true,
              fontSize: 10,
            ),
          ],
        ).vPadding(40).hPadding(15),
      ),
    );
  }
}
