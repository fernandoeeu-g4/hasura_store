import 'package:mobx/mobx.dart';
import 'package:mobx_hasura/app/modules/home/repositories/home_respository.dart';
import 'package:mobx_hasura/app/shared/models/ProductModel.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  _HomeBase(this._homeRepository) {
    loadProducts();
  }

  final HomeRepository _homeRepository;

  @observable
  ObservableFuture<List<ProductModel>> productsList;

  @action
  void loadProducts() {
    productsList = _homeRepository.getProducts().asObservable();
  }

}
