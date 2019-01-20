import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryTemperature implements Category {
  @override
  Color color = DefaultColor.lime;

  @override
  String imageLocation = 'assets/images/temperature.png';

  @override
  int index = 5;

  @override
  String title = 'Suhu';

  @override
  CategoryType type = CategoryType.temperature;

  @override
  List<Unit> units = [
    Unit(
      index: 0,
      title: 'Celcius',
      abbreviation: 'C',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 1,
      title: 'Farenheit',
      abbreviation: 'F',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 2,
      title: 'Kelvin',
      abbreviation: 'K',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 3,
      title: 'Reamur',
      abbreviation: 'R',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
  ];
}
