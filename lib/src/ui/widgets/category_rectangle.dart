import 'package:flutter/material.dart';
import 'package:satuan_app/src/models/category.dart';

class CategoryContainer extends StatelessWidget {

  final Category category;

  CategoryContainer(this.category);

  @override
  Widget build(BuildContext context) {
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
  }

}