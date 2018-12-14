import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/ui/fragments/sample_fragment.dart';

class CategoryPage extends StatelessWidget {

  DefaultWidget _defaultWidget = DefaultWidget();
  final CategoryList categoryList;
  ApplicationBloc appBloc;

  CategoryPage(this.categoryList);

  @override
  Widget build(BuildContext context) {
    initBloc(context);
    return new StreamBuilder(
        stream: appBloc.outActiveCategory,
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
            body: new DefaultTabController(
              length: categoryList.total,
              child: new Column(
                children: <Widget>[
                  new Container(
                    constraints: BoxConstraints(maxHeight: 150.0),
                    decoration: BoxDecoration(
                      color: snapshot.data.color,
                    ),
                    child: new TabBar(
                      isScrollable: false,
                      indicatorColor: Colors.white,
                      tabs: _tabCollections(),
                    ),
                  ),
                  new Expanded(
                    child: new TabBarView(
                      children: _fragmentCollections(),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void initBloc(BuildContext context) {
    appBloc = BlocProvider.of<ApplicationBloc>(context);
    appBloc.inActiveCategory.add(categoryList.active);
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

  List<Widget> _fragmentCollections() {
    List<Widget> fragments = List<Widget>();
    categoryList.list.forEach((category) {
      fragments.add(new SampleFragment(category));
    });
    return fragments;
  }
  
}
