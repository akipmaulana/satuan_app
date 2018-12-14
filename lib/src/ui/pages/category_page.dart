import 'package:flutter/material.dart';

import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/blocs/application_bloc.dart';
import 'package:satuan_app/src/blocs/bloc_provider.dart';

class CategoryPage extends StatefulWidget {

  final CategoryList categoryList;
  const CategoryPage({Key key, this.categoryList}) : super(key: key);

  @override
  CategoryPageState createState() => CategoryPageState();

}

class CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin<CategoryPage> {

  DefaultWidget _defaultWidget = DefaultWidget();
  TabController _tabController;
  BuildContext context;
  ApplicationBloc appBloc;

  @override
  void initState() {
    super.initState();
//    _tabController = new TabController(vsync: this, length: 6, initialIndex: 0);
    //_tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initBloc(context);
    return new StreamBuilder(
        stream: appBloc.outActiveCategory,
        builder: (BuildContext context, AsyncSnapshot<Category> snapshot) {
          return new Scaffold(
            appBar: new AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: _defaultWidget.titleBar(snapshot.data.title),
              backgroundColor: snapshot.data.color,
            ),
            body: new DefaultTabController(
              length: widget.categoryList.total,
              child: new Column(
                children: <Widget>[
                  new Container(
                    constraints: BoxConstraints(maxHeight: 150.0),
                    decoration: BoxDecoration(
                      color: snapshot.data.color,
                    ),
                    child: new TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      indicatorColor: Colors.white,
                      tabs: _tabCollections(),
                    ),
                  ),
                  new Expanded(
                    child: new TabBarView(
                      controller: _tabController,
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
        });
  }

  void _handleTabSelection() {
    widget.categoryList.setActiveCategory(index: _tabController.index);
    appBloc.inActiveCategory.add(widget.categoryList.active);
  }

  void initBloc(BuildContext context) {
    this.context = context;
    appBloc = BlocProvider.of<ApplicationBloc>(context);
    appBloc.inActiveCategory.add(widget.categoryList.active);
  }

  List<Widget> _tabCollections() {
    List<Widget> tabs = List<Widget>();
    widget.categoryList.list.forEach((category) {
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
