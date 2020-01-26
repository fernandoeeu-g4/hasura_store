import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/modules/home/repositories/add_products_repository.dart';
import 'package:mobx_hasura/app/shared/models/ProductCategoryModel.dart';

part 'add_product_controller.g.dart';

class AddProductController = _AddProductBase with _$AddProductController;

abstract class _AddProductBase with Store {

  _AddProductBase(this._addProductsRepository) {
    loadProductsCategories();
  }

  final AddProductsRepository _addProductsRepository;

  @observable
  ObservableFuture<List<DropdownMenuItem>> categoriesDropDownItems;

  @observable
  String productCategoryDropdownValue = null;

  @action
  void loadProductsCategories() {
    categoriesDropDownItems = _addProductsRepository.getProductsCategories().asObservable();
  }

  @action
  void setProductCategoryDropdownValue(String val) {
    productCategoryDropdownValue = val;
  }


}
