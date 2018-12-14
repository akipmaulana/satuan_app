import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/ui/pages/category_page.dart';

class CategoryContainer extends StatelessWidget {

  final int index;
  final CategoryList categoryList;

  CategoryContainer(this.index, this.categoryList);

  @override
  Widget build(BuildContext context) {

    return new InkWell(
      highlightColor: categoryList.active.color,
      splashColor: categoryList.active.color,
      onTap: () {
        categoryList.setActiveCategory(index: index);
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (BuildContext context) {
            return BlocProvider<ApplicationBloc>(
              bloc: ApplicationBloc(),
              child: CategoryPage(categoryList),
            );
          }),
        );
      },
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: categoryList.active.color,
        ),
        margin: new EdgeInsets.all(2.0),
        child: new Center(
          child: new Padding(
            padding: EdgeInsets.all(DefaultDimen.spaceLarge),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  categoryList.active.imageLocation,
                  width: 48.0,
                  height: 48.0,
                ),
                new Text(
                  categoryList.active.title,
                  style: new TextStyle(
                    fontSize: DefaultDimen.textMedium,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
