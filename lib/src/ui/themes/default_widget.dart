import 'package:flutter/material.dart';
import 'default_style.dart';
import 'default_res.dart';
import 'package:satuan_app/src/models/unit.dart';

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
      style: _defaultStyle.textTitle(color == null ? Colors.white : color),
    );
  }

  TextFormField textFormField({
    @required Unit unit,
  }) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        labelText: unit.abbreviation,
        helperText: unit.title,
        helperStyle: _defaultStyle.helperTextField(),
      ),
      controller: unit.controller,
      textDirection: TextDirection.rtl,
    );
  }

  dynamic paddingSymmetric(double horizontal, double vertical,
      {bool isWrap = true}) {
    final edgeInset =
        EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    return isWrap
        ? edgeInset
        : Padding(
            padding: edgeInset,
          );
  }
}
