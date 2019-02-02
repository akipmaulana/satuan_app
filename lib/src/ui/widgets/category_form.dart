import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:satuan_app/src/models/unit.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_widget.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';
import 'package:satuan_app/src/ui/widgets/unit_calculation_result_list.dart';

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
  final TextEditingController _textEditingController = TextEditingController();
  DefaultWidget _defaultWidget = new DefaultWidget();
  bool didCalculated = false;
  Unit sourceUnit;
  int selectedIndex = 0;
  List<Unit> _resultUnits = List<Unit>();
  bool didLoad = false;

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
  }

  @override
  Widget build(BuildContext context) {
    sourceUnit = widget.category.units[selectedIndex];
    _resetSelectedSatuan();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          didCalculated
              ? _calculateAgain()
              : _calculateEachUnit(sourceValue: _textEditingController.text);
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
                      ? UnitCalculationResultList(
                          resultUnits: _resultUnits,
                          category: widget.category,
                          sourceUnit: sourceUnit,
                        )
                      : _defaultWidget.textFormField(
                          autoFocus: true,
                          controller: _textEditingController,
                          label: sourceUnit?.title,
                          helper: "Nilai ini akan dikonversi",
                          suffixText: sourceUnit?.abbreviation.toUpperCase(),
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
        selectedIndex = idx;
        setState(() {});
      },
    ).showModal(this.context);
  }

  void _calculateAgain() {
    didCalculated = false;
    setState(() {});
  }

  void _calculateEachUnit({String sourceValue}) {
    FocusScope.of(context).requestFocus(new FocusNode());
    didCalculated = true;
    _resultUnits = widget.category.calculate(from: sourceUnit.title, value: double.parse(sourceValue) ?? 0);
    setState(() {});
  }

  void _resetSelectedSatuan() {
    selectedIndex = 0;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
