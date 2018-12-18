import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryTime implements Category {
  @override
  Color color = DefaultColor.orange;

  @override
  String imageLocation = 'assets/images/time.png';

  @override
  int index = 4;

  @override
  String title = 'Time';

  @override
  CategoryType type = CategoryType.time;

  @override
  List<Unit> units = [
  ];
}