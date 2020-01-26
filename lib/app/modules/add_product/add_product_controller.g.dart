// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddProductController on _AddProductBase, Store {
  final _$categoriesDropDownItemsAtom =
      Atom(name: '_AddProductBase.categoriesDropDownItems');

  @override
  ObservableFuture<List<DropdownMenuItem<dynamic>>>
      get categoriesDropDownItems {
    _$categoriesDropDownItemsAtom.context
        .enforceReadPolicy(_$categoriesDropDownItemsAtom);
    _$categoriesDropDownItemsAtom.reportObserved();
    return super.categoriesDropDownItems;
  }

  @override
  set categoriesDropDownItems(
      ObservableFuture<List<DropdownMenuItem<dynamic>>> value) {
    _$categoriesDropDownItemsAtom.context.conditionallyRunInAction(() {
      super.categoriesDropDownItems = value;
      _$categoriesDropDownItemsAtom.reportChanged();
    }, _$categoriesDropDownItemsAtom,
        name: '${_$categoriesDropDownItemsAtom.name}_set');
  }

  final _$productCategoryDropdownValueAtom =
      Atom(name: '_AddProductBase.productCategoryDropdownValue');

  @override
  String get productCategoryDropdownValue {
    _$productCategoryDropdownValueAtom.context
        .enforceReadPolicy(_$productCategoryDropdownValueAtom);
    _$productCategoryDropdownValueAtom.reportObserved();
    return super.productCategoryDropdownValue;
  }

  @override
  set productCategoryDropdownValue(String value) {
    _$productCategoryDropdownValueAtom.context.conditionallyRunInAction(() {
      super.productCategoryDropdownValue = value;
      _$productCategoryDropdownValueAtom.reportChanged();
    }, _$productCategoryDropdownValueAtom,
        name: '${_$productCategoryDropdownValueAtom.name}_set');
  }

  final _$_AddProductBaseActionController =
      ActionController(name: '_AddProductBase');

  @override
  void loadProductsCategories() {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.loadProductsCategories();
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductCategoryDropdownValue(String val) {
    final _$actionInfo = _$_AddProductBaseActionController.startAction();
    try {
      return super.setProductCategoryDropdownValue(val);
    } finally {
      _$_AddProductBaseActionController.endAction(_$actionInfo);
    }
  }
}
