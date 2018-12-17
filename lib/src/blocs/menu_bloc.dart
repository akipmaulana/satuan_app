import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/models/unit.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class MenuBloc extends BlocBase {
  BehaviorSubject<List<Category>> _menuController =
      new BehaviorSubject<List<Category>>();
  Sink<List<Category>> get _inMenus => _menuController.sink;
  Stream<List<Category>> get outMenus => _menuController.stream;

  MenuBloc() {
    var _categories = <Category>[
      _createCategoryBerat(index: 0),
      _createCategoryPanjang(index: 1),
      _createCategoryArea(index: 2),
      _createCategoryVolume(index: 3),
      _createCategoryTime(index: 4),
      _createCategoryTemperature(index: 5),
    ];

    _inMenus.add(_categories);
  }

  Category _createCategoryBerat({int index}) {
    return Category(
      index: index,
      type: CategoryType.weight,
      title: 'Berat',
      imageLocation: 'assets/images/weight.png',
      color: DefaultColor.green,
      units: [
        Unit(index: 0, title: 'Ton', abbreviation: 'ton', value: 0.0),
        Unit(index: 1, title: 'Kwintal', abbreviation: 'kw', value: 0.0),
        Unit(index: 2, title: 'Kilogram', abbreviation: 'kg', value: 0.0),
        Unit(
            index: 3, title: 'Hektogram', abbreviation: 'hg (ons)', value: 0.0),
        Unit(index: 4, title: 'Dekagram', abbreviation: 'dag', value: 0.0),
        Unit(index: 5, title: 'Gram', abbreviation: 'g', value: 0.0),
        Unit(index: 6, title: 'Desigram', abbreviation: 'dg', value: 0.0),
        Unit(index: 7, title: 'Sentigram', abbreviation: 'cg', value: 0.0),
      ],
    );
  }

  Category _createCategoryPanjang({int index}) {
    return Category(
      index: index,
      type: CategoryType.length,
      title: 'Panjang',
      imageLocation: 'assets/images/length.png',
      color: DefaultColor.blue,
      units: [

      ],
    );
  }

  Category _createCategoryArea({int index}) {
    return Category(
      index: index,
      type: CategoryType.area,
      title: 'Area',
      imageLocation: 'assets/images/area.png',
      color: DefaultColor.amber,
      units: [

      ],
    );
  }

  Category _createCategoryVolume({int index}) {
    return Category(
      index: index,
      type: CategoryType.volume,
      title: 'Volume',
      imageLocation: 'assets/images/volume.png',
      color: DefaultColor.red,
      units: [

      ],
    );
  }

  Category _createCategoryTime({int index}) {
    return Category(
      index: index,
      type: CategoryType.time,
      title: 'Waktu',
      imageLocation: 'assets/images/time.png',
      color: DefaultColor.orange,
      units: [

      ],
    );
  }

  Category _createCategoryTemperature({int index}) {
    return Category(
      index: index,
      type: CategoryType.temparature,
      title: 'Suhu',
      imageLocation: 'assets/images/temperature.png',
      color: DefaultColor.lime,
      units: [

      ],
    );
  }

  void dispose() {
    super.dispose();
    _menuController.close();
  }
}
