import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Constant/Exeptions/exeptionsFile.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.icon,
      this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(this.color),
        padding: MaterialStateProperty.all(this.padding),
      ),
      child: this.icon != null
          ? Row(
              children: [
                this.icon!,
                SizedBox(
                  width: 5,
                ),
                '${this.title}'.toLabel(),
              ],
            )
          : '${this.title}'.toLabel(),
    );
  }
}

class CustomLable extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool? bold;

  const CustomLable(this.title,
      {Key? key, this.fontSize, this.color, this.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${this.title}',
      style: TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.bold! ? FontWeight.bold : FontWeight.normal,
        color: this.color,
      ),
    );
  }
}
