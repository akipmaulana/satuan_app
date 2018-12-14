import 'package:flutter/material.dart';


enum CategoryType {
  weight,
  temparature,
  length,
  area,
  volume,
  time
}

class Category {
  final CategoryType type;
  final String title;
  final String imageLocation;
  final Color color;

  Category(this.type, this.title, this.imageLocation, this.color);
}

class CategoryList {
  final List<Category> list;
  Category active;

  CategoryList(this.list, this.active);

  int get total => list.length;

  void setActiveCategory({int index}) {
    active = list[index];
  }
}