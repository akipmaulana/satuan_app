import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/ui/fragments/sample_fragment.dart';


class CategoryPage extends StatefulWidget {

  final CategoryList categoryList;

  CategoryPage(this.categoryList);

  @override
  CategoryPageState createState() => CategoryPageState(this.categoryList);

}

class CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {

  final DefaultWidget _defaultWidget = DefaultWidget();
  final CategoryList categoryList;
  ApplicationBloc appBloc;
  TabController _tabController;

  CategoryPageState(this.categoryList);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

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
                      controller: _tabController,
                    ),
                  ),
                  new Expanded(
                    child: new TabBarView(
                      controller: _tabController,
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

  void _handleTabSelection() {
    categoryList.setActiveCategory(index: _tabController.index);
    appBloc.inActiveCategory.add(categoryList.active);
  }

  List<Widget> _tabCollections() {
    List<Widget> tabs = List<Widget>();
    categoryList.data.forEach((category) {
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
    categoryList.data.forEach((category) {
      fragments.add(new SampleFragment(category));
    });
    return fragments;
  }
  
}
