import 'package:flutter/material.dart';
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
    Unit(index: 0, title: 'Ton', abbreviation: 'ton', value: 0.0),
    Unit(index: 1, title: 'Kwintal', abbreviation: 'kw', value: 0.0),
    Unit(index: 2, title: 'Kilogram', abbreviation: 'kg', value: 0.0),
    Unit(
        index: 3, title: 'Hektogram', abbreviation: 'hg (ons)', value: 0.0),
    Unit(index: 4, title: 'Dekagram', abbreviation: 'dag', value: 0.0),
    Unit(index: 5, title: 'Gram', abbreviation: 'g', value: 0.0),
    Unit(index: 6, title: 'Desigram', abbreviation: 'dg', value: 0.0),
    Unit(index: 7, title: 'Sentigram', abbreviation: 'cg', value: 0.0),
  ];
}