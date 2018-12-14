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
  final List<Category> data;
  Category active;

  CategoryList(this.data, this.active);

  int get total => data.length;

  void setActiveCategory({int index}) {
    active = data[index];
  }
}