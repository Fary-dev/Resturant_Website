import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/constant.dart';

class HoverAnimation extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final double? thickness;
  final Curve? curve;
  final int? milliseconde;

  const HoverAnimation(
      {Key? key,
      this.height,
      this.width,
      this.thickness,
      this.curve,
      this.milliseconde,
      this.child})
      : super(key: key);

  @override
  _HoverAnimationState createState() => _HoverAnimationState();
}

class _HoverAnimationState extends State<HoverAnimation> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
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
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: AnimatedContainer(
                  height: widget.thickness,
                  width: animate ? widget.width! + 4 : 25,
                  color: primaryColor,
                  curve: widget.curve!,
                  duration: Duration(milliseconds: widget.milliseconde!),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: AnimatedContainer(
                  width: widget.thickness,
                  height: animate ? widget.height! + 4 : 25,
                  color: primaryColor,
                  curve: widget.curve!,
                  duration: Duration(milliseconds: widget.milliseconde!),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: AnimatedContainer(
                  height: widget.thickness,
                  width: animate ? widget.width! + 4 : 25,
                  color: primaryColor,
                  curve: widget.curve!,
                  duration: Duration(milliseconds: widget.milliseconde!),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: AnimatedContainer(
                  width: widget.thickness,
                  height: animate ? widget.height! + 4 : 25,
                  color: primaryColor,
                  curve: widget.curve!,
                  duration: Duration(milliseconds: widget.milliseconde!),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: widget.milliseconde!),
                curve: widget.curve!,
                height: widget.height,
                width: widget.width,
                color: animate?Colors.transparent:primaryColor.withOpacity(0.3),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
