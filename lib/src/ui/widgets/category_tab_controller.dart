import 'package:flutter/material.dart';

import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/fragments/category_fragment.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/blocs/menu_bloc.dart';

class CategoryTabController extends StatefulWidget {
  final Category category;

  CategoryTabController(this.category);

  @override
  State<StatefulWidget> createState() {
    return CategoryTabControllerState(this.category);
  }
}

class CategoryTabControllerState extends State<CategoryTabController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ApplicationBloc appBloc;
  MenuBloc menuBloc;

  final Category category;

  CategoryTabControllerState(this.category);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    appBloc = BlocProvider.of<ApplicationBloc>(context);
    menuBloc = BlocProvider.of<MenuBloc>(context);
    menuBloc.outMenus.listen((categories) {
      _tabController = TabController(
          length: categories.length, vsync: this, initialIndex: category.index);
      _tabController.addListener(() => _handleTabSelection(categories));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<List<Category>>(
      stream: menuBloc.outMenus,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshots) {
        return new DefaultTabController(
          length: snapshots.data.length,
          child: new Column(
            children: <Widget>[
              new StreamBuilder<Category>(
                stream: appBloc.outActiveCategory,
                initialData: category,
                builder: (BuildContext context, AsyncSnapshot<Category> snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  }
                  return new Container(
                    constraints: BoxConstraints(maxHeight: 150.0),
                    decoration: BoxDecoration(
                      color: snapshot.data.color,
                    ),
                    child: new TabBar(
                      isScrollable: false,
                      indicatorColor: Colors.white,
                      tabs: _tabCollections(snapshots.data),
                      controller: _tabController,
                    ),
                  );
                },
              ),
              new Expanded(
                child: new TabBarView(
                  controller: _tabController,
                  children: _fragmentCollections(snapshots.data),
                ),
              ),
            ],
          ),
        );
      },
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

  void _handleTabSelection(List<Category> data) {
    appBloc.inActiveCategory.add(data[_tabController.index]);
  }
}
