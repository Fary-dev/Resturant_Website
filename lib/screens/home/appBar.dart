import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/constant.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              color: Colors.black.withOpacity(0.16),
              blurRadius: 30,
            )
          ]),
      child: Row(
        children: [
          Image.asset(
            'assets/logoWebSite.jpg',
            height: 25,
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5.0),
          Text(
            'Foodo'.toUpperCase(),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(title: 'Home', press: () {}),
          MenuItem(title: 'About', press: () {}),
          MenuItem(title: 'Contact', press: () {}),
          MenuItem(title: 'LogIn', press: () {}),
          if (widthSize > 700)
            Container(
              child: DefaultButton(
                text: 'Get Started',
                press: () {},
              ),
            )
        ],
      ),
    );
  }
}

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
