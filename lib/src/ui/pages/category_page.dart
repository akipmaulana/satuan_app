import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/ui/fragments/category_fragment.dart';
import 'package:satuan_app/src/ui/widgets/category_tab_controller.dart';

class CategoryPage extends StatelessWidget {

  final DefaultWidget _defaultWidget = DefaultWidget();
  final CategoryList categoryList;

  CategoryPage(this.categoryList);

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    return new StreamBuilder(
        stream: appBloc.outActiveCategory,
        initialData: categoryList.active,
        builder: (BuildContext context, AsyncSnapshot<Category> snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          return new Scaffold(
            appBar: new AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: _defaultWidget.titleBar(snapshot.data.title),
              backgroundColor: snapshot.data.color,
            ),
            body: CategoryTabController(categoryList),
          );
        });
  }
}
