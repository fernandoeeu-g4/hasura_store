import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx_hasura/app/shared/models/ProductModel.dart';
import 'package:mobx_hasura/app/shared/queries.dart';
import 'package:mobx/mobx.dart';

class HomeRepository extends Disposable {
  HomeRepository(this._hasuraConnect);

  final HasuraConnect _hasuraConnect;

  Future<List<ProductModel>> getProducts() async {
    final getProductsQuery = Queries.getProductsQuery;
    var snapshot = await _hasuraConnect.query(getProductsQuery);
    List<ProductModel> products = [];
    for (var json in (snapshot["data"]["product"] as List)) {
      ProductModel product = ProductModel.fromJson(json);
      products.add(product);
    }
    return products;
  }

  // List<ProductModel> getProducts() {
  //   return [
  //     ProductModel(
  //         name: 'Bolsa Gucci',
  //         productCategory: 'Bolsa',
  //         productType: 'Moda',
  //         price: 123),
  //   ];
  // }

  @override
  void dispose() {}
}
