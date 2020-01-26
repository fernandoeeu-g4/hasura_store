import 'package:flutter/src/widgets/framework.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_controller.dart';
import 'package:mobx_hasura/app/modules/add_product/add_product_module.dart';
import 'package:mobx_hasura/app/modules/home/repositories/add_products_repository.dart';
import 'package:mobx_hasura/app/modules/home/repositories/home_respository.dart';
import 'package:mobx_hasura/app/modules/home/widgets/product_card/product_card_controller.dart';
import 'package:mobx_hasura/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_hasura/app/modules/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => ProductCardController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        // repositórios
        Bind((i) => HomeRepository(i.get<HasuraConnect>())),
        // Bind((i) => HomeRepository()),
        // Outros
        Bind((i) => HasuraConnect("https://loja-hasura-mobx.herokuapp.com/v1/graphql"))
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/product/add', module: AddProductModule())
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  // TODO: implement view
  Widget get view => HomePage();
}
