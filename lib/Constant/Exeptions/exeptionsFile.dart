import 'package:flutter/material.dart';
import 'package:flutter_app/Constant/widgets.dart';

extension ContextExtenstion on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension StringExtenstion on String {
  Widget toLabel({double? fontSize, Color? color, bool? bold}) => CustomLable(
        this,
        bold: bold,
        fontSize: fontSize,
        color: color,
      );
}
