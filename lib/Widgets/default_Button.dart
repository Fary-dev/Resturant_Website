import 'package:flutter/material.dart';
import 'package:flutter_app/Colors/constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      // ignore: deprecated_member_use
      child: FlatButton(
          splashColor: Color(0xFFFFFFFF),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          onPressed: press,
          color: buttonColor,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
