// ignore_for_file: overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/bloc_state.dart';
import 'package:flutter_app/Constant/constant.dart';
import 'package:flutter_app/Exeptions/extensionFile.dart';
import 'package:flutter_app/Widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

TextEditingController mobile = TextEditingController();
TextEditingController pass = TextEditingController();
bool remember = false;

// ignore: must_be_immutable
class LoginWeb extends StatelessWidget {
  final BlocState state;
  LoginWeb({required this.state, Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: context.width * 0.3 < 350 ? 350 : context.width * 0.3,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'Images/welcome.svg',
                  height: 100,
                ),
                'Welcome to your $RESTURANT_NAME'
                    .toLabel(fontSize: 20, bold: true)
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
                    'Remember me.'.toLabel(fontSize: 12).hPadding(10),
                    MSwitch(
                      value: remember,
                      onChanged: (val) => remember = val,
                      hint: 'Remember me',
                    ),
                  ],
                ),
                AbsorbPointer(
                  absorbing: state is Loding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MButton(
                        title: 'Login',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.userBloc
                                .authenticete(mobile.text, pass.text, remember);
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
                          if (_formKey.currentState!.validate()) {
                            context.userBloc
                                .authenticete(mobile.text, pass.text, remember);
                          }
                        },
                        color: const Color(0xffffffff),
                        isTextButton: true,
                        fontSize: 10,
                      ),
                    ],
                  ).vPadding(20),
                ),
                if (state is Loding) MIndicator() else Container(),
                if (state is Faild)
                  MError(exception: (state as Faild).exception)
                else
                  Container(),
              ],
            ),
          ),
        ).aPadding(20),
      ).center,
    );
  }
}
