import 'package:flutter/material.dart';
import 'default_res.dart';

class DefaultStyle {
  TextStyle textButton({Color color, double textSize}) {
    return new TextStyle(
        color: color == null ? Colors.white : color,
        fontWeight: FontWeight.bold,
        fontSize: textSize == null ? DefaultDimen.textLarge : textSize);
  }

  TextStyle textField() {
    return new TextStyle(fontSize: DefaultDimen.textLarge, color: Colors.black,);
  }

  TextStyle helperTextField() {
    return new TextStyle(
      fontWeight: DefaultFontWight.light,
    );
  }

  TextStyle textTitle(Color color) {
    return new TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: DefaultDimen.textLarge,
    );
  }

  InputDecoration decorationTextField(String hint) {
    return new InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(DefaultDimen.spaceMedium));
  }
}
