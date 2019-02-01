import 'package:flutter/material.dart';
import 'package:satuan_app/src/constant.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryTemperature extends Category {
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
      title: Temperature.Celcius,
      abbreviation: 'C',
      value: 0.0,
    ),
    Unit(
      index: 1,
      title: Temperature.Farenheit,
      abbreviation: 'F',
      value: 0.0,
    ),
    Unit(
      index: 2,
      title: Temperature.Kelvin,
      abbreviation: 'K',
      value: 0.0,
    ),
    Unit(
      index: 3,
      title: Temperature.Reamur,
      abbreviation: 'R',
      value: 0.0,
    ),
  ];

  @override
  List<Unit> calculate({String from, double value}) {
    double celcius = 0.0;
    double farenheit = 0.0;
    double reamur = 0.0;
    double kelvin = 0.0;
    // K = C + 273
    if (from == Temperature.Celcius) {
      celcius = value;
      kelvin = celcius + 273;
      farenheit = (9 / 5) * celcius + 32;
      reamur = (4/5) * celcius;
    } else if (from == Temperature.Farenheit) {
      farenheit = value;
      celcius = (5 / 9) * (farenheit - 32);
      kelvin = celcius + 273;
      reamur = (4/5) * celcius;
    } else if (from == Temperature.Reamur) {
      reamur = value;
      celcius = reamur * (5/4);
      kelvin = celcius + 273;
      farenheit = (9 / 5) * celcius + 32;
    } else if (from == Temperature.Kelvin) {
      kelvin = value;
      celcius = kelvin - 273;
      farenheit = (9 / 5) * celcius + 32;
      reamur = (4/5) * celcius;
    }

    units[0].value = celcius;
    units[1].value = farenheit;
    units[2].value = kelvin;
    units[3].value = reamur;
    return units;
  }

  @override
  double calculator(double value, {String from, String to}) {
    // TODO: implement calculator
    return 0;
  }
}
