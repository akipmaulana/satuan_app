import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryLength implements Category {
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
      index: 0,
      title: 'Kilometer',
      abbreviation: 'km',
      value: 0.0,
    ),
    Unit(
      index: 1,
      title: 'Hektometer',
      abbreviation: 'hm',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: 'Dekameter',
      abbreviation: 'dam',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: 'Meter',
      abbreviation: 'm',
      value: 0.0,
    ),
    Unit(
      index: 4,
      title: 'Desimeter',
      abbreviation: 'dm',
      value: 0.0,
    ),
    Unit(
      index: 5,
      title: 'Sentimeter',
      abbreviation: 'cm',
      value: 0.0,
    ),
    Unit(
      index: 6,
      title: 'Milimeter',
      abbreviation: 'mm',
      value: 0.0,
    ),
  ];

  @override
  List<Unit> calculate({@required String from, @required double value}) {
    return units;
  }
}
