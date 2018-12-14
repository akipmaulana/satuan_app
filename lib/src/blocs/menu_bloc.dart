import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';
import 'package:satuan_app/src/models/category.dart';
import 'package:satuan_app/src/ui/themes/default_res.dart';

class MenuBloc extends BlocBase {

  BehaviorSubject<List<Category>> _menuController = new BehaviorSubject<List<Category>>();
  Sink<List<Category>> get _inMenus => _menuController.sink;
  Stream<List<Category>> get outMenus => _menuController.stream;

  MenuBloc() {
    var _categories = <Category>[
      Category(index: 0, type: CategoryType.weight, title: 'Berat', imageLocation: 'assets/images/weight.png', color: DefaultColor.green),
      Category(index: 1, type: CategoryType.length, title: 'Panjang', imageLocation: 'assets/images/length.png', color: DefaultColor.blue),
      Category(index: 2, type: CategoryType.area, title: 'Area', imageLocation: 'assets/images/area.png', color: DefaultColor.amber),
      Category(index: 3, type: CategoryType.volume, title: 'Volume', imageLocation: 'assets/images/volume.png', color: DefaultColor.red),
      Category(index: 4, type: CategoryType.time, title: 'Waktu', imageLocation: 'assets/images/time.png', color: DefaultColor.orange),
      Category(index: 5, type: CategoryType.temparature, title: 'Suhu', imageLocation: 'assets/images/temperature.png', color: DefaultColor.lime),
    ];

    _inMenus.add(_categories);
  }

  void dispose(){
    super.dispose();
    _menuController.close();
  }
}
