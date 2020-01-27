import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/modules/home/repositories/add_products_repository.dart';
import 'package:mobx_hasura/app/shared/models/ProductCategoryModel.dart';

part 'add_product_controller.g.dart';

class AddProductController = _AddProductBase with _$AddProductController;

abstract class _AddProductBase with Store {
  _AddProductBase(this._addProductsRepository) {
    loadProductsCategories();
    loadProductsTypes();
  }

  final AddProductsRepository _addProductsRepository;

  @observable
  ObservableFuture<List<DropdownMenuItem>> categoriesDropDownItems;

  @observable
  ObservableFuture<List<DropdownMenuItem>> typesDropdownItems;

  @observable
  String productCategoryDropdownValue;

  @observable
  String productTypeDropdownValue;

  @observable
  String productDescription = '';

  @observable
  double productPrice = 0;

  @action
  void setProductDescription(String val) {
    productDescription = val;
  }

  @action
  void setProductPrice(double val) {
    productPrice = val;
  }

  // @computed
  // bool getIsValid = getProductTypeDropdownValue != null;

  @action
  bool isValid() {
    return productTypeDropdownValue != null &&
        productCategoryDropdownValue != null &&
        productDescription.length > 10 &&
        productPrice > 0;
  }

  @action
  void loadProductsCategories() {
    categoriesDropDownItems =
        _addProductsRepository.getProductsCategories().asObservable();
  }

  @action
  void loadProductsTypes() {
    typesDropdownItems =
        _addProductsRepository.getProductsTypes().asObservable();
  }

  @action
  void setProductCategoryDropdownValue(String val) {
    productCategoryDropdownValue = val;
  }

  @action
  void setProductTypeDropdownValue(String val) {
    productTypeDropdownValue = val;
  }
}
