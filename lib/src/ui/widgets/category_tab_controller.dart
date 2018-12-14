import 'package:flutter/material.dart';

import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/fragments/category_fragment.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';

class CategoryTabController extends StatefulWidget {

  final CategoryList categoryList;

  CategoryTabController(this.categoryList);

  @override
  State<StatefulWidget> createState() {
    return CategoryTabControllerState(categoryList);
  }
}

class CategoryTabControllerState extends State<CategoryTabController> with SingleTickerProviderStateMixin {

  final CategoryList categoryList;
  TabController _tabController;
  ApplicationBloc appBloc;

  CategoryTabControllerState(this.categoryList);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categoryList.total, vsync: this, initialIndex: categoryList.selectedIndex);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {
    appBloc = BlocProvider.of<ApplicationBloc>(context);
    return new DefaultTabController(
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
    );
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
      fragments.add(new CategoryFragment(category));
    });
    return fragments;
  }

  void _handleTabSelection() {
    categoryList.setActiveCategory(index: _tabController.index);
    appBloc.inActiveCategory.add(categoryList.active);
  }

}