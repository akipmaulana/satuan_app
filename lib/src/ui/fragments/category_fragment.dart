import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/widgets/category_form.dart';
import 'package:satuan_app/src/models/category.dart';

class CategoryFragment extends StatelessWidget  {
  final Category category;

  CategoryFragment(this.category);

  @override
  Widget build(BuildContext context) {
    return CategoryForm(
      category: category,
    );
  }
}
