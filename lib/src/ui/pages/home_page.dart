import 'package:flutter/material.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/blocs/menu_bloc.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/widgets/category_rectangle.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';

class HomePage extends StatelessWidget {

  static const TITLE = 'Converter';

  final DefaultWidget _defaultWidget = DefaultWidget();

  @override
  Widget build(BuildContext context) {

    final MenuBloc menuBloc = BlocProvider.of<MenuBloc>(context);

    return Scaffold(
      appBar: _defaultWidget.appBar(TITLE),
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder<List<Category>>(
          stream: menuBloc.outMenus,
          builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.data == null) {
              return Container();
            }
            return GridView.count(
              crossAxisCount: 2,
              children: snapshot.data.map((category) {
                if (snapshot.data != null) {
                  CategoryList categoryList = CategoryList(
                      snapshot.data, category);
                  return new CategoryContainer(categoryList);
                }
                return new Container();
              }).toList(),
              padding: EdgeInsets.all(DefaultDimen.spaceDoubleExtraLarge),
              crossAxisSpacing: DefaultDimen.spaceSmall,
              mainAxisSpacing: DefaultDimen.spaceSmall,
            );
          },
        ),
      ),
    );
  }
}


