import 'package:flutter/material.dart';

import 'package:satuan_app/src/models/category.dart';

class CategoryFragment extends StatelessWidget {

  final Category category;

  CategoryFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return new Image.asset(
      category.imageLocation,
      width: 32.0,
      height: 32.0,
      color: category.color,
    );
  }

}