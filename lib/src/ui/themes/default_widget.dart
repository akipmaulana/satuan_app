import 'package:flutter/material.dart';
import 'default_style.dart';
import 'default_res.dart';

class DefaultWidget {
  DefaultStyle _defaultStyle = new DefaultStyle();

  AppBar appBar(String title) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: titleBar(title, color: DefaultColor.blue),
      backgroundColor: Colors.white,
    );
  }

  Text titleBar(String text, {Color color}) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: _defaultStyle.textTitle(color == null ? Colors.white : color ),
    );
  }

  dynamic paddingSymmetric(double horizontal, double vertical, {bool isWrap = true}) {
    final edgeInset = EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    return isWrap
        ? edgeInset
        : Padding(
      padding: edgeInset,
    );
  }
}
