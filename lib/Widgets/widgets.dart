import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Constant/exeptionsFile.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final double? padding;
  final double? radius;
  final double?borderWidth;
  final Color?borderColor;


  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.icon,
      this.color,
      this.radius,
      this.padding,
      this.borderWidth,
      this.borderColor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color??Theme.of(context).primaryColor),
        padding: MaterialStateProperty.all(EdgeInsets.all(padding??0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius??0),
                  side: BorderSide(color:borderColor??Theme.of(context).primaryColor,width:borderWidth??0 ),
              ),
          ),
      ),

      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon!,color:color==Color(0xffffffff)?Theme.of(context).primaryColor:Color(0xffffffff),size: 18,),
                const SizedBox(
                  width: 15.0,
                ),
                '${title}'.toLabel(color: color==Color(0xffffffff)?Theme.of(context).primaryColor:Color(0xffffffff),),
              ],
            ).hPadding(20)
          // : '${this.title}'.toLabel(),
      :  '${title}'.toLabel(color: color==Color(0xffffffff)?Theme.of(context).primaryColor:Color(0xffffffff),).hPadding(20),
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool? bold;

  const CustomText(this.title,
      { this.fontSize, this.color, this.bold,Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: bold==true ? FontWeight.bold : FontWeight.normal,
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
  late final TextInputType?textInputType;

  CustomTextField({
    this.prefixIcon,
    this.suffixIcon,
    required this.lable,
    this.validator,
    this.controller,
    this.autoFocus = false,
    this.onChange,
    this.onSave,
    this.obscureText=false,
    this.inputFormatters,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.textInputType,
      inputFormatters:this.inputFormatters,
      controller: this.controller,
      style:
      Theme.of(context).textTheme.button,
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

