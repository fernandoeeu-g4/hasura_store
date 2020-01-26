import 'package:flutter/src/widgets/framework.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_page.dart';
import 'package:mobx_hasura/app/modules/home/repositories/add_products_repository.dart';

class AddProductModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => AddProductController(i.get<AddProductsRepository>())),
        
        Bind((i) => AddProductsRepository(i.get<HasuraConnect>())),
        Bind((i) => HasuraConnect("https://loja-hasura-mobx.herokuapp.com/v1/graphql"))
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddProductPage()),
      ];

  static Inject get to => Inject<AddProductModule>.of();

  @override
  // TODO: implement view
  Widget get view => AddProductPage();
}
