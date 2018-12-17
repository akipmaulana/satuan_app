import 'package:flutter/material.dart';

import 'package:satuan_app/src/models/unit.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';

class CategoryForm extends StatefulWidget {

  final Category category;

  CategoryForm({this.category});

  @override
  State<StatefulWidget> createState() {
    return CategoryFormState(category: category);
  }
}

class CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  final Category category;

  DefaultWidget _defaultWidget = new DefaultWidget();

  CategoryFormState({this.category});

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: fieldCollections(),
                  ),
                ),
              ),
              Container(),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> fieldCollections() {
    return category.units.map((Unit unit) {
      return _defaultWidget.textFormField(unit);
    }).toList();
  }
}
