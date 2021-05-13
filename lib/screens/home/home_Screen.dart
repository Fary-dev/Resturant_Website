import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/centeredView.dart';
import 'package:flutter_app/screens/home/appBar.dart';
import 'package:flutter_app/screens/home/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFDB0707),
                    Color(0xFF02000B),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CenterView(child: CustomAppBar()),
                  Spacer(),
                  CenterView(child: Body()),
                  Spacer(flex: 2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
