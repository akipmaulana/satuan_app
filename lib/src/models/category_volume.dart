import 'dart:math';

import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryVolume extends Category {
  @override
  Color color = DefaultColor.red;

  @override
  String imageLocation = 'assets/images/volume.png';

  @override
  int index = 3;

  @override
  String title = 'Volume';

  @override
  CategoryType type = CategoryType.volume;

  @override
  List<Unit> units = [
    Unit(
      index: 1,
      title: 'Kilometer Kubik',
      abbreviation: 'km3',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: 'Hektometer Kubik',
      abbreviation: 'hm3',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: 'Dekameter Kubik',
      abbreviation: 'dam3',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: 'Meter Kubik',
      abbreviation: 'm3',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: 'Desimeter Kubik',
      abbreviation: 'dm3',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: 'Sentimeter Kubik',
      abbreviation: 'cm3',
      value: 0.0,
    ),
    Unit(
      index: 7,
      title: 'Milimeter Kubik',
      abbreviation: 'mm3',
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
    return value * pow(1000, exponent);
  }
}