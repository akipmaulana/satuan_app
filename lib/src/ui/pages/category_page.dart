import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/blocs/menu_bloc.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/ui/widgets/category_tab_controller.dart';

class CategoryPage extends StatelessWidget {
  final DefaultWidget _defaultWidget = DefaultWidget();
  final Category category;

  CategoryPage(this.category);

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    final MenuBloc menuBloc = BlocProvider.of<MenuBloc>(context);
    return new StreamBuilder<Category>(
        stream: appBloc.outActiveCategory,
        initialData: category,
        builder: (context, snapshot) {
          return new Scaffold(
            appBar: new AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: _defaultWidget.titleBar(snapshot.data.title),
              backgroundColor: snapshot.data.color,
            ),
            body: CategoryTabController(
              menuBloc.categories,
              snapshot.data,
            ),
          );
        });
  }
}
