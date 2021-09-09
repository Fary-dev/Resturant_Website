import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Exeptions/exeptionsFile.dart';
import 'package:flutter_app/Moduls/OnburingModul.dart';
import 'package:flutter_app/screens/login_width_mobile_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final double? padding;
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
    this.color,
    this.radius,
    this.padding,
    this.borderWidth,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(color ?? Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(padding ?? 0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(radius ?? 0),
              side: BorderSide(
                  color: borderColor ?? Theme.of(context).primaryColor,
                  width: borderWidth ?? 0),
            ),
          ),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon!,
                    color: color == Color(0xffffffff)
                        ? Theme.of(context).primaryColor
                        : Color(0xffffffff),
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  '${title}'.toLabel(
                    color: color == Color(0xffffffff)
                        ? Theme.of(context).primaryColor
                        : Color(0xffffffff),
                  ),
                ],
              )
            // : '${this.title}'.toLabel(),
            : '${title}'
                .toLabel(
                  color: color == Color(0xffffffff)
                      ? Theme.of(context).primaryColor
                      : Color(0xffffffff),
                )
                .hPadding(20),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool? bold;
  final TextAlign? alignment;

  const CustomText(
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

class CustomTextField extends StatelessWidget {
  late final Widget? suffixIcon;
  late final Widget? prefixIcon;
  late final String? lable;
  late final Function(String?)? onChange;
  late final Function(String?)? onSave;
  late final FormFieldValidator<String>? validator;
  late final bool autoFocus;
  late final bool? obscureText;
  late final TextEditingController? controller;
  late final List<TextInputFormatter>? inputFormatters;
  late final TextInputType? textInputType;

  CustomTextField({
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.textInputType,
      inputFormatters: this.inputFormatters,
      controller: this.controller,
      style: Theme.of(context).textTheme.button,
      obscureText: this.obscureText!,
      validator: this.validator,
      onSaved: this.onSave,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: this.lable,
        suffixIcon: this.suffixIcon,
        prefixIcon: this.prefixIcon,
      ),
    );
  }
}

class Onbording extends StatelessWidget {
  final List<OnbordingContent> contents;

  Onbording(this.contents, {Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = 0.obs;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                '${contents[index].title}'.toLabel(fontSize: 25, bold: true).vPadding(15),
                '${contents[index].description}'.toLabel(
                    fontSize: 18,
                    color: Colors.grey,
                    alignment: TextAlign.left),
              ],
            ).aPadding(30),
          ).expanded,
          Container(
            child: Row(
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
          ),
          Obx(
            () => CustomButton(
              title: currentIndex == contents.length - 1 ? 'Continue' : 'Next',
              onTap: () {
                if (currentIndex == contents.length - 1) {
                  Get.to<Widget>(MobileApp());
                }
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.bounceIn);
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
