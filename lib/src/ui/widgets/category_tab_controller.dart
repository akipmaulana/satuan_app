import 'package:flutter/material.dart';

import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/fragments/category_fragment.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';

class CategoryTabController extends StatefulWidget {
  final List<Category> categories;
  final Category active;

  CategoryTabController(this.categories, this.active);

  int get selectedIndex => active.index;
  int get totalIndex => categories.length;

  @override
  State<StatefulWidget> createState() {
    return CategoryTabControllerState();
  }
}

class CategoryTabControllerState extends State<CategoryTabController>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  ApplicationBloc _appBloc;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _appBloc = BlocProvider.of<ApplicationBloc>(context);
    _tabController = TabController(
        length: widget.totalIndex, vsync: this, initialIndex: widget.selectedIndex);
    _tabController.addListener(() => _handleTabSelection());
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: widget.totalIndex,
      child: new Column(
        children: <Widget>[
          new Container(
            constraints: BoxConstraints(maxHeight: 150.0),
            decoration: BoxDecoration(
              color: widget.active.color,
            ),
            child: new TabBar(
              isScrollable: false,
              indicatorColor: Colors.white,
              tabs: _tabCollections(widget.categories),
              controller: _tabController,
            ),
          ),
          new Expanded(
            child: new TabBarView(
              controller: _tabController,
              children: _fragmentCollections(widget.categories),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _tabCollections(List<Category> data) {
    List<Widget> tabs = List<Widget>();
    data.forEach((category) {
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

  List<Widget> _fragmentCollections(List<Category> data) {
    List<Widget> fragments = List<Widget>();
    data.forEach((category) {
      fragments.add(new CategoryFragment(category));
    });
    return fragments;
  }

  void _handleTabSelection() {
    _appBloc.inActiveCategory.add(widget.categories[_tabController.index]);
  }
}
