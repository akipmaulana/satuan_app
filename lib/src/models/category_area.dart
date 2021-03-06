import 'dart:math';

import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryArea extends Category {
  @override
  Color color = DefaultColor.amber;

  @override
  String imageLocation = 'assets/images/area.png';

  @override
  int index = 2;

  @override
  String title = 'Area';

  @override
  CategoryType type = CategoryType.area;

  @override
  List<Unit> units = [
    Unit(
      index: 1,
      title: 'Kilometer Persegi',
      abbreviation: 'km2',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: 'Hektometer Persegi / Hektar',
      abbreviation: 'hm2/ha',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: 'Dekameter Persegi',
      abbreviation: 'dam2',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: 'Meter Persegi',
      abbreviation: 'm2',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: 'Desimeter Persegi',
      abbreviation: 'dm2',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: 'Sentimeter Persegi',
      abbreviation: 'cm2',
      value: 0.0,
    ),
    Unit(
      index: 7,
      title: 'Milimeter Persegi',
      abbreviation: 'mm2',
      value: 0.0,
    ),
  ];

  double calculator(double value,
      {@required String from, @required String to}) {
    if (from == to) {
      return value;
    }
    final startIndex = units.firstWhere((unit) => unit.title == from).index;
    final endIndex = units.firstWhere((unit) => unit.title == to).index;
    final exponent = endIndex - startIndex;
    return value * pow(100, exponent);
  }
}