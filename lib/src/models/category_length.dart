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
  ];
}