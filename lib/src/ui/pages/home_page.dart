import 'package:flutter/material.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/models/category.dart';

class HomePage extends StatelessWidget {
  static const TITLE = 'Converter';

  DefaultWidget _defaultWidget = DefaultWidget();

  var _categories = <Category>[
    Category(CategoryType.weight, 'Berat', 'assets/images/weight.png', Colors.green),
    Category(CategoryType.length, 'Panjang', 'assets/images/length.png', Colors.blue),
    Category(CategoryType.area, 'Area', 'assets/images/area.png', Colors.amber),
    Category(CategoryType.volume, 'Volume', 'assets/images/volume.png', Colors.red),
    Category(CategoryType.time, 'Waktu', 'assets/images/time.png', Colors.orange),
    Category(CategoryType.temparature, 'Suhu', 'assets/images/temperature.png', Colors.lime),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _defaultWidget.appBar(TITLE),
      backgroundColor: Colors.white,
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: _categories.map((category) {
            return new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: category.color,
              ),
              margin: new EdgeInsets.all(1.0),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      category.imageLocation,
                      width: 32.0,
                      height: 32.0,
                    ),
                    new Text(
                      category.title,
                      style: new TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
          padding: EdgeInsets.all(64),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
      ),
    );
  }
}
