import 'dart:math';

import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryLength extends Category {
  @override
  Color color = DefaultColor.blue;

  @override
  String imageLocation = 'assets/images/length.png';

  @override
  int index = 1;

  @override
  String title = 'Panjang';

  @override
  CategoryType type = CategoryType.length;

  @override
  List<Unit> units = [
    Unit(
      index: 1,
      title: 'Kilometer',
      abbreviation: 'km',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: 'Hektometer',
      abbreviation: 'hm',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: 'Dekameter',
      abbreviation: 'dam',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: 'Meter',
      abbreviation: 'm',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: 'Desimeter',
      abbreviation: 'dm',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: 'Sentimeter',
      abbreviation: 'cm',
      value: 0.0,
    ),
    Unit(
      index: 7,
      title: 'Milimeter',
      abbreviation: 'mm',
      value: 0.0,
    ),
  ];

  @override
  double calculator(double value, {String from, String to}) {
    if (from == to) {
      return value;
    }
    final startIndex = units.firstWhere((unit) => unit.title == from).index;
    final endIndex = units.firstWhere((unit) => unit.title == to).index;
    final exponent = endIndex - startIndex;
    return value * pow(10, exponent);
  }
}
