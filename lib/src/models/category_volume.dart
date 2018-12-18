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
  ];
}