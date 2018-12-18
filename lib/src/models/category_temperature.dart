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
  ];
}