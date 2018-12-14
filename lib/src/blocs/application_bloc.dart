import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';
import 'package:satuan_app/src/models/category.dart';

class ApplicationBloc extends BlocBase {

  BehaviorSubject<Category> _activeCategoryController = new BehaviorSubject<Category>();
  Sink<Category> get inActiveCategory => _activeCategoryController.sink;
  Stream<Category> get outActiveCategory => _activeCategoryController.stream;

  ApplicationBloc();

  void dispose(){
    super.dispose();
    _activeCategoryController.close();
  }
}
