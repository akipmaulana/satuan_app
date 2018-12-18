import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryArea implements Category {
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
  ];
}