import 'package:flutter/material.dart';
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
      body: ListView(
        physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        children: [
          Expanded(
            child: Container(
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
                )
                    // image: DecorationImage(
                    //   image: AssetImage('assets/WebSiteBkg.jpg'),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomAppBar(),
                    Spacer(),
                    Body(),
                    Spacer(
                      flex: 2,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
