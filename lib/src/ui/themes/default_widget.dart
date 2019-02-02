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

  Text buildText({
    @required String text,
    Color color,
    FontWeight fontWeight,
    int maxLines = 99,
    double fontSize,
    TextAlign textAlign,
  }) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        color: color ?? DefaultColor.darkGray2,
        fontWeight: fontWeight,
        fontSize: fontSize ?? DefaultDimen.textMedium,
      ),
    );
  }

  TextFormField textFormField({
    String label,
    String helper,
    String suffixText,
    TextEditingController controller,
    TextDirection textDirection,
    Function onPressed,
    bool autoFocus = false,
  }) {
    return TextFormField(
      autofocus: autoFocus,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        labelText: label,
        helperText: helper,
        helperStyle: _defaultStyle.helperTextField(),
        suffix: suffixText != null
            ? FlatButton(
                onPressed: () {
                  onPressed();
                },
                child: Text(
                  suffixText,
                  style: TextStyle(
                    fontWeight: DefaultFontWight.bold,
                  ),
                ),
                textTheme: ButtonTextTheme.primary,
              )
            : Container(
                width: DefaultDimen.spaceDoubleExtraLarge,
              ),
      ),
      controller: controller,
      textDirection: textDirection,
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
