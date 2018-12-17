import 'package:flutter/material.dart';

import 'package:satuan_app/src/models/unit.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';

class CategoryForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryFormState();
  }
}

class CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();

  DefaultWidget _defaultWidget = new DefaultWidget();

  List<Unit> units = <Unit>[
    Unit(index: 0, title: 'Ton', abbreviation: 'ton', value: 0.0),
    Unit(index: 1, title: 'Kwintal', abbreviation: 'kw', value: 0.0),
    Unit(index: 2, title: 'Kilogram', abbreviation: 'kg', value: 0.0),
    Unit(index: 3, title: 'Hektogram', abbreviation: 'hg (ons)', value: 0.0),
    Unit(index: 4, title: 'Dekagram', abbreviation: 'dag', value: 0.0),
    Unit(index: 5, title: 'Gram', abbreviation: 'g', value: 0.0),
    Unit(index: 6, title: 'Desigram', abbreviation: 'dg', value: 0.0),
    Unit(index: 7, title: 'Sentigram', abbreviation: 'cg', value: 0.0),
  ];

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
    return units.map((Unit unit) {
      return _defaultWidget.textFormField(unit);
    }).toList();
  }
}
