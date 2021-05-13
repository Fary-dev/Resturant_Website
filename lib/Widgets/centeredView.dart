import 'package:flutter/material.dart';

class CenterView extends StatelessWidget {
  final Widget child;

  const CenterView({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1400),
        child: child,
      ),
    );
  }
}
