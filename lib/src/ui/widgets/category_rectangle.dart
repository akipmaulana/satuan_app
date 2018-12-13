import 'package:flutter/material.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryContainer extends StatelessWidget {
  final Category category;

  CategoryContainer(this.category);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        highlightColor: category.color,
        splashColor: category.color,
        onTap: () {

        },
        child: new Container(
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: category.color,
          ),
          margin: new EdgeInsets.all(2.0),
          child: new Center(
            child: new Padding(
              padding: EdgeInsets.all(DefaultDimen.spaceLarge),
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
                      fontSize: DefaultDimen.textMedium,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
