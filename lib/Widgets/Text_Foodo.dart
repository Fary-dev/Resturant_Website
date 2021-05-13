import 'package:flutter/material.dart';

class FoodoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              offset: Offset(0, -2.0),
              color: Color(0xFFC00E0E).withOpacity(0.80))
        ],
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFF000000),
      ),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(0.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'F',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE50668))),
            TextSpan(
                text: 'oo',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF))),
            TextSpan(
                text: 'Do',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE50668))),
          ],
        ),
      ),
    );
  }
}
