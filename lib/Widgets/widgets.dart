// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Exeptions/extensionFile.dart';
import 'package:flutter_app/Moduls/OnburingModul.dart';
import 'package:flutter_app/screens/login_width_mobile_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class MBloc<t> {
  BehaviorSubject<t> _bloc = BehaviorSubject();
  Stream<t> get stream => _bloc.stream;
  t get value => _bloc.value;

  void setValue(t val) => _bloc.add(val);
}

class MButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final double? padding;
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;
  final bool? isTextButton;
  final double? fontSize;

  const MButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
    this.color,
    this.radius,
    this.padding,
    this.borderWidth,
    this.borderColor,
    this.isTextButton = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: isTextButton!
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  color ?? Theme.of(context).primaryColor,
                ),
                padding:
                    MaterialStateProperty.all(EdgeInsets.all(padding ?? 0)),
              )
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  color ?? Theme.of(context).primaryColor,
                ),
                padding:
                    MaterialStateProperty.all(EdgeInsets.all(padding ?? 0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 0),
                    side: BorderSide(
                      color: borderColor ?? Theme.of(context).primaryColor,
                      width: borderWidth ?? 0,
                    ),
                  ),
                ),
              ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: color == const Color(0xffffffff)
                        ? Theme.of(context).primaryColor
                        : const Color(0xffffffff),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  title.toLabel(
                    color: color == const Color(0xffffffff)
                        ? Theme.of(context).primaryColor
                        : const Color(0xffffffff),
                  ),
                ],
              )
            : title
                .toLabel(
                  color: color == const Color(0xffffffff)
                      ? Theme.of(context).primaryColor
                      : const Color(0xffffffff),
                  fontSize: fontSize,
                )
                .hPadding(20),
      ),
    );
  }
}

class MText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool? bold;
  final TextAlign? alignment;

  const MText(
    this.title, {
    this.fontSize,
    this.color,
    this.bold,
    this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}

class MTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? lable;
  final Function(String?)? onChange;
  final Function(String?)? onSave;
  final FormFieldValidator<String>? validator;
  final bool autoFocus;
  final bool? obscureText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final bool isEmpety;

  const MTextField({
    this.prefixIcon,
    this.suffixIcon,
    required this.lable,
    this.validator,
    this.controller,
    this.autoFocus = false,
    this.onChange,
    this.onSave,
    this.obscureText = false,
    this.inputFormatters,
    this.textInputType,
    this.isEmpety = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      controller: controller,
      style: Theme.of(context).textTheme.button,
      obscureText: obscureText!,
      validator: validator,
      onSaved: onSave,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: lable,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

class Onbording extends StatelessWidget {
  final List<OnbordingContent> contents;

  Onbording(this.contents, {Key? key}) : super(key: key);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final RxInt currentIndex = 0.obs;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: contents.length,
            onPageChanged: (int index) => currentIndex.value = index,
            itemBuilder: (_, index) => Column(
              children: [
                SvgPicture.asset(
                  contents[index].image,
                  height: 300,
                ),
                contents[index]
                    .title
                    .toLabel(fontSize: 25, bold: true)
                    .vPadding(15),
                contents[index].description.toLabel(
                      fontSize: 18,
                      color: Colors.grey,
                      alignment: TextAlign.left,
                    ),
              ],
            ).aPadding(30),
          ).expanded,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              contents.length,
              (index) => Obx(
                () => Container(
                  height: 10,
                  width: currentIndex.value == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ).aMargin(5),
              ),
            ),
          ),
          Obx(
            () => MButton(
              // ignore: unrelated_type_equality_checks
              title: currentIndex == contents.length - 1 ? 'Continue' : 'Next',
              onTap: () {
                // ignore: unrelated_type_equality_checks
                if (currentIndex == contents.length - 1) {
                  Get.to<Widget>(MobileApp());
                }
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.bounceIn,
                );
              },
              color: Theme.of(context).primaryColor,
              radius: 18,
            ).vPadding(25),
          ),
        ],
      ),
    );
  }
}

class MSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String? hint;
  MSwitch({required this.value, required this.onChanged, this.hint, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<bool> _value = MBloc<bool>()..setValue(value);
    return StreamBuilder<bool>(
      stream: _value.stream,
      builder: (_, snapshot) {
        if (snapshot.hasData)
          return hint != null
              ? Tooltip(
                  message: hint!,
                  child: Switch(
                    onChanged: (val) {
                      onChanged(val);
                      _value.setValue(val);
                    },
                    value: snapshot.data!,
                  ),
                )
              : Switch(
                  onChanged: (val) {
                    onChanged(val);
                    _value.setValue(val);
                  },
                  value: snapshot.data!,
                );
        return Container();
      },
    );
  }
}

class MError extends StatelessWidget {
  final Exception exception;
  const MError({required this.exception, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: exception.toString().toLabel(
              color: Color(0xffffffff),
              bold: true,
            ),
      );
}

class MIndicator extends StatelessWidget {
  MIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoActivityIndicator().center;
}
