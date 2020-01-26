import 'package:mobx/mobx.dart';

part 'product_card_controller.g.dart';

class ProductCardController = _ProductCardBase with _$ProductCardController;

abstract class _ProductCardBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
