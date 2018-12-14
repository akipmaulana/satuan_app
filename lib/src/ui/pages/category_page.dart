import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/blocs/menu_bloc.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';


class CategoryPage extends StatelessWidget  {
  final DefaultWidget _defaultWidget = DefaultWidget();

  final CategoryList categoryList;

  CategoryPage(this.categoryList);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: _defaultWidget.titleBar(categoryList.active.title),
        backgroundColor: categoryList.active.color,
      ),
      body: new DefaultTabController(
        length: categoryList.total,
        child: new Column(
          children: <Widget>[
            new Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              decoration: BoxDecoration(
                color: categoryList.active.color,
              ),
              child: new TabBar(
                isScrollable: false,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: _tabCollections(),
              ),
            ),
            new Expanded(
              child: new TabBarView(
                children: [
                  new Icon(Icons.map),
                  new Icon(Icons.cake),
                  new Icon(Icons.access_alarm),
                  new Icon(Icons.offline_pin),
                  new Icon(Icons.queue),
                  new Icon(Icons.message),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _tabCollections() {
    List<Widget> tabs = List<Widget>();
    categoryList.list.forEach((category) {
      tabs.add(new Tab(
        icon: new Image.asset(
          category.imageLocation,
          width: 32.0,
          height: 32.0,
        ),
      ));
    });
    return tabs;
  }
}
