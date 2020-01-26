import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx_hasura/app/modules/home/widgets/product_card/product_card_controller.dart';
import 'package:mobx_hasura/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  ProductCardController productcard;

  setUp(() {
    productcard = HomeModule.to.get<ProductCardController>();
  });

  group('ProductCardController Test', () {
    test("First Test", () {
      expect(productcard, isInstanceOf<ProductCardController>());
    });

    test("Set Value", () {
      expect(productcard.value, equals(0));
      productcard.increment();
      expect(productcard.value, equals(1));
    });
  });
}
