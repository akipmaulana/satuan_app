import 'package:flutter/material.dart';

class Unit {
  static final String defaultValueUnit = "";

  final int index;
  final String title;
  final String abbreviation;
  double value = 0.0;

  Unit({this.index, this.title, this.abbreviation, this.value});
}