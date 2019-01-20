import 'package:flutter/material.dart';

class Unit {
  static final String defaultValueUnit = "";

  final int index;
  final String title;
  final String abbreviation;
  final double value;
  final TextEditingController controller;

  const Unit({this.index, this.title, this.abbreviation, this.value, this.controller});
}