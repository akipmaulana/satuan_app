import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class MenuBloc extends BlocBase {

  ///
  /// Synchronous Stream to handle the provision of the movie genres
  ///
  BehaviorSubject<List<Category>> _menuController = new BehaviorSubject<List<Category>>();
  Sink<List<Category>> get _inMenus => _menuController.sink;
  Stream<List<Category>> get outMenus => _menuController.stream;

  MenuBloc() {
    var _categories = <Category>[
      Category(CategoryType.weight, 'Berat', 'assets/images/weight.png', DefaultColor.green),
      Category(CategoryType.length, 'Panjang', 'assets/images/length.png', DefaultColor.blue),
      Category(CategoryType.area, 'Area', 'assets/images/area.png', DefaultColor.amber),
      Category(CategoryType.volume, 'Volume', 'assets/images/volume.png', DefaultColor.red),
      Category(CategoryType.time, 'Waktu', 'assets/images/time.png', DefaultColor.orange),
      Category(CategoryType.temparature, 'Suhu', 'assets/images/temperature.png', DefaultColor.lime),
    ];

    _inMenus.add(_categories);
  }

  void dispose(){
    super.dispose();
    _menuController.close();
  }
}
