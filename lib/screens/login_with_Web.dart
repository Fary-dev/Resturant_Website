// ignore_for_file: overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/state_bloc.dart';
import 'package:flutter_app/Bloc/user_bloc.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_app/Exeptions/extensionFile.dart';

TextEditingController mobile = TextEditingController();
TextEditingController pass = TextEditingController();
bool remember = false;

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  UserBloc controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: 400,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Obx(
            () => Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.state is LodingUser) MIndicator(),
                  SvgPicture.asset(
                    'Images/welcome.svg',
                    height: 100,
                  ),
                  'Welcome to your $RESTURANT_NAME'
                      .toLabel(
                        textStyle: Theme.of(context).textTheme.headline1!,
                      )
                      .vPadding(20),
                  MTextField(
                    lable: 'User Name',
                    controller: mobile,
                    validator: (val) {
                      if ((val ?? '').isEmpty) return 'can not be empety';
                      return null;
                    },
                  ),
                  MTextField(
                    lable: 'Password',
                    obscureText: true,
                    controller: pass,
                    validator: (val) {
                      if ((val ?? '').isEmpty) return 'can not be empety';
                      return null;
                    },
                  ).vPadding(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Remember me.'
                          .toLabel(
                            textStyle: Theme.of(context).textTheme.headline1!,
                          )
                          .hPadding(10),
                      MSwitch(
                        value: remember,
                        onChanged: (val) => remember = val,
                        hint: 'Remember me',
                      ),
                    ],
                  ),
                  AbsorbPointer(
                    absorbing: controller.state is LodingUser,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MButton(
                          title: 'Login',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              controller.signIn(
                                  mobile.text, pass.text, remember);
                            }
                          },
                          radius: 10,
                          padding: 15,
                          icon: Icons.vpn_key_rounded,
                        ),
                        MButton(
                          title: 'SignUp',
                          onTap: () {},
                          radius: 10,
                          padding: 15,
                          borderWidth: 0,
                          color: const Color(0xffffffff),
                          icon: Icons.edit,
                        ).vPadding(10),
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
                    ).vPadding(20),
                  ),
                  if (controller.state is FaildUser)
                    MError(exception: (controller.state as FaildUser).massage)
                ],
              ),
            ),
          ),
        ).aPadding(20),
      ).center,
    );
  }
}
