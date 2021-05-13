import 'package:flutter/material.dart';
import 'package:flutter_app/Colors/constant.dart';
import 'package:flutter_app/Widgets/Text_Foodo.dart';
import 'package:flutter_app/Widgets/default_Button.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Colors.black.withOpacity(0.80),
              blurRadius: 30,
            )
          ]),
      child: Row(
        children: [
          SizedBox(width: 5),
          FoodoText(),
          Spacer(),
          MenuItem(title: 'Home', press: () {}),
          MenuItem(title: 'About', press: () {}),
          MenuItem(title: 'Contact', press: () {}),
          MenuItem(title: 'LogIn', press: () {}),
          if (widthSize > 600)
            Container(
              child: DefaultButton(
                text: 'Get Started',
                press: () {},
              ),
            ),
          SizedBox(width: 10)
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;
  const MenuItem({Key key, this.title, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: menuTextColor.withOpacity(0.80)),
        ),
      ),
    );
  }
}
