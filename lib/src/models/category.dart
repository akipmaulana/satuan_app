import 'package:flutter/material.dart';
import 'package:satuan_app/src/models/unit.dart';

enum CategoryType {
  weight,
  temparature,
  length,
  area,
  volume,
  time
}

class Category {
  final int index;
  final CategoryType type;
  final String title;
  final String imageLocation;
  final Color color;
  final List<Unit> units;

  Category({this.type, this.title, this.imageLocation, this.color, this.index, this.units});
}

class CategoryList {
  final List<Category> data;
  Category active;
  int selectedIndex;

  CategoryList(this.data, this.active);

  int get total => data.length;

  void setActiveCategory({int index}) {
    this.selectedIndex = index;
    active = data[index];
  }
}