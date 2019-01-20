import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryVolume implements Category {
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
      index: 0,
      title: 'Kilometer Kubik',
      abbreviation: 'km3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 1,
      title: 'Hektometer Kubik',
      abbreviation: 'hm3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 2,
      title: 'Dekameter Kubik',
      abbreviation: 'dam3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 3,
      title: 'Meter Kubik',
      abbreviation: 'm3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 4,
      title: 'Desimeter Kubik',
      abbreviation: 'dm3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 5,
      title: 'Sentimeter Kubik',
      abbreviation: 'cm3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
    Unit(
      index: 6,
      title: 'Milimeter Kubik',
      abbreviation: 'mm3',
      value: 0.0,
      controller: TextEditingController(text: Unit.defaultValueUnit),
    ),
  ];
}