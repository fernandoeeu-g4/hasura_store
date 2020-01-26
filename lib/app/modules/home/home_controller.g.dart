// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$productsListAtom = Atom(name: '_HomeBase.productsList');

  @override
  ObservableFuture<List<ProductModel>> get productsList {
    _$productsListAtom.context.enforceReadPolicy(_$productsListAtom);
    _$productsListAtom.reportObserved();
    return super.productsList;
  }

  @override
  set productsList(ObservableFuture<List<ProductModel>> value) {
    _$productsListAtom.context.conditionallyRunInAction(() {
      super.productsList = value;
      _$productsListAtom.reportChanged();
    }, _$productsListAtom, name: '${_$productsListAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void loadProducts() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.loadProducts();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
