import 'dart:math';

import 'package:flutter/material.dart';
import 'package:satuan_app/src/constant.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryWeight implements Category {

  @override
  Color color = DefaultColor.green;

  @override
  String imageLocation = 'assets/images/weight.png';

  @override
  int index = 0;

  @override
  String title = 'Berat';

  @override
  CategoryType type = CategoryType.weight;

  @override
  List<Unit> units = [
    Unit(
      index: 1,
      title: Weight.Ton,
      abbreviation: "ton",
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: Weight.Kwintal,
      abbreviation: 'kw',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: Weight.Kilogram,
      abbreviation: 'kg',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: Weight.Hektogram,
      abbreviation: 'hg (ons)',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: Weight.Dekagram,
      abbreviation: 'dag',
      value: 0.0,
    ),
    Unit(
      index: 7,
      title: Weight.Gram,
      abbreviation: 'g',
      value: 0.0,
    ),
    Unit(
      index: 8,
      title: Weight.Desigram,
      abbreviation: 'dg',
      value: 0.0,
    ),
    Unit(
      index: 9,
      title: Weight.Sentigram,
      abbreviation: "cg",
      value: 0.0,
    ),
  ];

  @override
  List<Unit> calculate({@required String from, @required double value}) {
    return units.map((unit) {
      unit.value = calculator(value, from: from, to: unit.title);
      return unit;
    }).toList();
  }

  double calculator(double value,
      {@required String from, @required String to}) {
    if (from == to) {
      return value;
    }
    final startIndex = units.firstWhere((unit) => unit.title == from).index;
    final endIndex = units.firstWhere((unit) => unit.title == to).index;
    final exponent = endIndex - startIndex;
    return value * pow(10, exponent);
  }
}
