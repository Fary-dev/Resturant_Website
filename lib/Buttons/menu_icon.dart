import 'package:flutter/material.dart';
import 'package:flutter_app/Extension/extensionFile.dart';

class MenuIcon extends StatefulWidget {
  final Color?color;
  const MenuIcon({this.color,Key? key}) : super(key: key);

  @override
  _MenuIconState createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 28,
      child: InkWell(
        child: MouseRegion(
          onEnter: (val) {
            setState(() {
              animate = true;
            });
          },
          onExit: (val) {
            setState(() {
              animate = false;
            });
          },
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 5,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOutSine,
                  height: 2.0,
                  width: animate ? 28 : 28,
                  decoration: BoxDecoration(
                    color:widget.color?? Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 11,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOutSine,
                  height: 2.0,
                  width: animate ? 28 : 22,
                  decoration: BoxDecoration(
                    color:widget.color?? Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 17,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOutSine,
                  height: 2.0,
                  width: animate ? 28 : 16,
                  decoration: BoxDecoration(
                    color:widget.color?? Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).aPadding(10);
  }
}
