import 'package:flutter/material.dart';

import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/models/category.dart';

class SampleFragment extends StatelessWidget {

  final Category category;

  SampleFragment(this.category);

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