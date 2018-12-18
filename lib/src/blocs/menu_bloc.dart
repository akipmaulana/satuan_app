import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';
import 'package:satuan_app/src/models/category.dart';

class MenuBloc extends BlocBase {
  BehaviorSubject<List<Category>> _menuController =
      new BehaviorSubject<List<Category>>();
  Sink<List<Category>> get _inMenus => _menuController.sink;
  Stream<List<Category>> get outMenus => _menuController.stream;

  var categories = <Category>[
    CategoryFactory.category(of: CategoryType.weight),
    CategoryFactory.category(of: CategoryType.length),
    CategoryFactory.category(of: CategoryType.area),
    CategoryFactory.category(of: CategoryType.time),
    CategoryFactory.category(of: CategoryType.temperature),
    CategoryFactory.category(of: CategoryType.volume),
  ];

  MenuBloc() {
    categories.sort((a, b) => a.index.compareTo(b.index));
    _inMenus.add(categories);
  }

  void dispose() {
    super.dispose();
    _menuController.close();
  }
}
