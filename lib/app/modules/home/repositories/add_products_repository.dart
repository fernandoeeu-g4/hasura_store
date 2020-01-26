import 'package:hasura_connect/hasura_connect.dart';
import 'package:flutter/material.dart';
import 'package:mobx_hasura/app/shared/models/ProductCategoryModel.dart';
import 'package:mobx_hasura/app/shared/queries.dart';

class AddProductsRepository {
  AddProductsRepository(this._hasuraConnect);

  final HasuraConnect _hasuraConnect;

  Future<List<DropdownMenuItem>> getProductsCategories() async {
    try {
      final String getProductsCategoriesQuery = Queries.getProductsCategories;
      var snapshot = await _hasuraConnect.query(getProductsCategoriesQuery);
      List<ProductCategoryModel> categories = [];
      List<DropdownMenuItem> items = [];
      for (var json in (snapshot["data"]["product_category"] as List)) {
        ProductCategoryModel category = ProductCategoryModel.fromJson(json);
        categories.add(category);
      }
      categories.forEach((i) => items.add(DropdownMenuItem(child: Text(i.description), value: i.id,)));
      return items; 
    } catch (e) {
      throw e;
    }
  }
}
