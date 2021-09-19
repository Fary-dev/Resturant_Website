// ignore_for_file: file_names, require_trailing_commas, implementation_imports, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/widgets.dart';

extension ContextExtenstion on BuildContext {
  double get widthScreen => MediaQuery.of(this).size.width;
  double get heightScreen => MediaQuery.of(this).size.height;
  void pageRoute(Widget child) =>
      Navigator.of(this).push(MaterialPageRoute<void>(builder: (_) => child));
}

extension StringExtenstion on String {
  Widget toLabel({
    double? fontSize,
    Color? color,
    bool bold = false,
    TextAlign? alignment,
    TextStyle? textStyle,
    double? opacity,
  }) =>
      MText(
        replaceAll('Exception:', ''),
        bold: bold,
        fontSize: fontSize,
        color: color,
        alignment: alignment,
        textStyle: textStyle,
        opacity: opacity,
      );
}

extension WidgetExtenstion on Widget {
  Widget vPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);
  Widget hPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);
  Widget aPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget vMargin(double padding) =>
      Container(margin: EdgeInsets.symmetric(vertical: padding), child: this);
  Widget hMargin(double padding) =>
      Container(margin: EdgeInsets.symmetric(horizontal: padding), child: this);
  Widget aMargin(double padding) =>
      Container(margin: EdgeInsets.all(padding), child: this);

  Widget get expanded => Expanded(
        child: this,
      );

  Widget get card => Card(
        child: this,
      );

  Widget get center => Center(
        child: this,
      );
}
