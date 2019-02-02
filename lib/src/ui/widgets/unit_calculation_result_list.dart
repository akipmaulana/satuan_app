import 'package:flutter/material.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/models/unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';

class UnitCalculationResultList extends StatelessWidget {

  final Category category;
  final List<Unit> resultUnits;
  final Unit sourceUnit;
  final DefaultWidget _defaultWidget = new DefaultWidget();

  UnitCalculationResultList({this.resultUnits, this.category, this.sourceUnit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resultUnits.map((Unit unit) {
        return Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: sourceUnit.title == unit.title
                ? DefaultColor.darkGray3
                : category.color,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 8,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(DefaultDimen.spaceMedium),
                  decoration: BoxDecoration(
                    color: DefaultColor.lightGray1,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _defaultWidget.buildText(
                            text: unit.title,
                            fontWeight: DefaultFontWight.bold,
                          ),
                          _defaultWidget.buildText(
                            text: unit.abbreviation,
                          ),
                        ],
                      ),
                      _defaultWidget.buildText(
                        text: unit.value.toString(),
                        fontWeight: DefaultFontWight.medium,
                        fontSize: DefaultDimen.textLarge,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
                flex: 3,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

}