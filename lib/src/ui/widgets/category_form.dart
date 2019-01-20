import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:satuan_app/src/models/unit.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class CategoryForm extends StatefulWidget {
  final Category category;

  CategoryForm({this.category});

  @override
  State<StatefulWidget> createState() {
    return CategoryFormState();
  }
}

class CategoryFormState extends State<CategoryForm>
    with AutomaticKeepAliveClientMixin<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  DefaultWidget _defaultWidget = new DefaultWidget();
  bool didCalculated = false;
  String sourceUnit = "";
  List<Unit> _resultUnits = List<Unit>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourceUnit = widget.category.units.first.abbreviation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          didCalculated
              ? _calculateAgain()
              : _calculateEachUnit(
              sourceValue: _textEditingController.text);
        },
        child: didCalculated ? Icon(Icons.refresh) : Icon(Icons.swap_vert),
        backgroundColor: widget.category.color,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(16),
                  child: didCalculated
                      ? Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _renderResultUnits(),
                          ),
                        )
                      : _defaultWidget.textFormField(
                          autoFocus: true,
                          controller: _textEditingController,
                          label: "Satuan",
                          helper: "Nilai ini akan dikonversi",
                          suffixText: sourceUnit.toUpperCase(),
                          onPressed: () {
                            _showPickerWidget();
                          }),
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPickerWidget() {
    Picker(
      adapter: PickerDataAdapter<String>(
        pickerdata: widget.category.units.map((unit) => unit.title).toList(),
      ),
      changeToFirst: true,
      hideHeader: false,
      cancelTextStyle: TextStyle(
        color: Colors.grey,
        fontWeight: DefaultFontWight.bold,
        fontSize: DefaultDimen.textMedium,
      ),
      confirmTextStyle: TextStyle(
        color: widget.category.color,
        fontWeight: DefaultFontWight.bold,
      ),
      cancelText: "BATAL",
      confirmText: "PILIH",
      onConfirm: (Picker picker, List value) {
        final int idx = value.first;
        sourceUnit = widget.category.units[idx].abbreviation;
        setState(() {});
      },
    ).showModal(this.context);
  }

  List<Widget> _renderResultUnits() {
    return _resultUnits.map((Unit unit) {
      return Container(
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: sourceUnit == unit.abbreviation
              ? DefaultColor.darkGray3
              : widget.category.color,
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
    }).toList();
  }

  void _calculateAgain() {
    didCalculated = false;
    setState(() {});
  }

  void _calculateEachUnit({String sourceValue}) {
    FocusScope.of(context).requestFocus(new FocusNode());
    didCalculated = true;
    _resultUnits = widget.category.units.map((unit) {
      unit.value = (double.parse(sourceValue) ?? 0) * 10;
      return unit;
    }).toList();
    setState(() {});
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
