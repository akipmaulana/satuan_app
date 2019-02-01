import 'package:flutter/material.dart';
import 'package:satuan_app/src/models/unit.dart';
import 'category_area.dart';
import 'category_length.dart';
import 'category_temperature.dart';
import 'category_time.dart';
import 'category_weight.dart';
import 'category_volume.dart';

enum CategoryType {
  weight,
  temperature,
  length,
  area,
  volume,
  time
}

abstract class Category {
  int index;
  CategoryType type;
  String title;
  String imageLocation;
  Color color;
  List<Unit> units;

  double calculator(double value,
      {@required String from, @required String to});

  List<Unit> calculate({@required String from, @required double value}) {
    return units.map((unit) {
      unit.value = calculator(value, from: from, to: unit.title);
      return unit;
    }).toList();
  }
}

class CategoryFactory {
  static Category category({ CategoryType of }) {
    switch (of) {
      case CategoryType.weight:
        return new CategoryWeight();
      case CategoryType.length:
        return new CategoryLength();
      case CategoryType.area:
        return new CategoryArea();
      case CategoryType.volume:
        return new CategoryVolume();
      case CategoryType.time:
        return new CategoryTime();
      case CategoryType.temperature:
        return new CategoryTemperature();
      default:
        return null;
    }
  }
}
